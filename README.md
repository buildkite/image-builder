# image-builder
Uses EC2 image builder to bake images for [elastic CI stack Buildkite agents](https://github.com/buildkite/elastic-ci-stack-for-aws).

## Prerequisites
 - You should already have a [Buildkite elastic CI stack](https://github.com/buildkite/elastic-ci-stack-for-aws) (version 4.5 or above) deployed and running in an AWS environment
 - A [bootstrap script](#bootstrap-script) hosted in an S3 bucket
 - An SSM parameter for storing the latest AMI ID resulting from the image builder process
 - An SSM parameter that describes which image you're using based on a Buildkite AMI or similar
 - (Optional) a secrets bucket for any SSH keys and other secrets needed in the resulting AMI
 - (Optional) a VPC to run the image builder stack inside of

## Getting started

[![Launch AWS Stack](https://cdn.rawgit.com/buildkite/cloudformation-launch-stack-button-svg/master/launch-stack.svg)](https://console.aws.amazon.com/cloudformation/home#/stacks/new?stackName=bk-image-builder&templateURL=https://s3.amazonaws.com/buildkite-image-builder/latest/aws-stack.yml)

**Parameters**:
 - `BaseAmiParameter`: SSM parameter to specify the Base AMI to build intermediate images on top of.
 - `OutputAmiParameter`: SSM parameter to use for built AMI IDs.
 - `BootstrapScriptUrl`: AMI customisation script, downloaded and executed as part of the image build (must be an S3:// URL).
 - `InstanceType`: Instance type for the Image Builder instances.
 - `SecretsBucket`: Optional – Buildkite elastic CI stack secrets bucket.
 - `SubnetId`: Optional - the subnet to schedule ImageBuilder EC2 instances in. If blank, a simple public subnet VPC is created.
 - `ScheduleExpression`: Optional - cron expression for when to run image builds, defaults to nightly at midnight.

**Stack outputs**:
 - `OutputTopic`: an SNS topic that is notified when new images have been built.

### Caveat: Parameter creator
When creating the output parameter for this template, if you choose to use the [SSM parameter datatype](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ssm-parameter.html#cfn-ssm-parameter-datatype) `aws:ec2:image` it will incur some latency for reading that SSM parameter while AWS validates the EC2 image does exist. You can avoid this issue by using the `text` datatype.

### Applying built images to Elastic Stack

In order to update an Elastic CI stack with new built images:
 - Specify the SSM AMI parameter `ImageIdParameter` in the Elastic CI as set in `OutputAmiParameter`.
 - Run a CloudFormation update on each Elastic CI stack that needs to use the newly built AMI.

## Use-cases
You can use image builder to improve cold boot performance of elastic stack agents. Some examples of things to do in the bootstrap script would be:
- Pre-caching large github repositories using the [git-mirrors feature](https://github.com/buildkite/agent/blob/efdf3067f59c721af4f81be78aae61e509b83fb6/EXPERIMENTS.md#git-mirrors) (`EnableAgentGitMirrorsExperiment` set true in the Elastic CI stack).
- Installing necessary tooling such as test utilities or languages
- Pulling down docker images
- Pulling down packages e.g. Ruby gems or NPM packages.

If you want to take more advantage of EC2 Image Builder [component manager documents](https://docs.aws.amazon.com/imagebuilder/latest/userguide/image-builder-application-documents.html), consider forking this repository. See also: [Supported action modules](https://docs.aws.amazon.com/imagebuilder/latest/userguide/image-builder-action-modules.html).


## Bootstrap script
The following is an example Bootstrap script that's used to set up a git-mirror on the AMI.
```sh
#!/bin/sh

set -xeo pipefail

echo at=init >&2

mkdir -p ~/.ssh
echo "github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==" >> ~/.ssh/known_hosts

echo at=github-host >&2

# Example of file name munging for a git-mirror
chmod u=rw,go= /tmp/secrets/id_rsa
repository=/var/lib/buildkite-agent/git-mirrors/git-github-com-keithduncan-hello-world-private-git
GIT_SSH_COMMAND='ssh -i /tmp/secrets/id_rsa -o IdentitiesOnly=yes' git clone git@github.com:keithduncan/hello-world-private.git "${repository}"
chown -R buildkite-agent:buildkite-agent "${repository}"
echo at=cloned >&2

# Verify the repository contents are present
cat "${repository}/secrets"

echo at=verified >&2
```

## Secrets management
A secrets bucket can be specified to manage secrets for downloading git repositories or packages to the image. This feature is implemented using [S3Download](https://docs.aws.amazon.com/imagebuilder/latest/userguide/image-builder-action-modules.html#image-builder-action-modules-s3download) and downloaded to `/tmp/secrets` which is deleted as part of the end phase of image creation so that secrets don't end up baked in to the final iamge.

If you want to use [Secrets Manager](https://aws.amazon.com/secrets-manager/) for these resources, consider forking this repository.

## (Advanced) SNS topic format
If you want to make your infrastructure respond to SNS notifications produced when an image is built, the following is the schema published:
```json
{
  "event": "NewImage",
  "NewImage": 
  {
    "ami": "<image-id>"
  }
}
```

The AMI region will be the same as the image-builder stack, you can optionally subscribe across regions but will need to specify the source region when using the AMI.
