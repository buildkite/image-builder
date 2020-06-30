Event Schema:

```
{
    "Records": [
        {
            "EventSource": "aws:sns",
            "EventVersion": "1.0",
            "EventSubscriptionArn": "arn:aws:sns:us-east-1:253121499730:image-builder9-PipelineTopic-KAPDAYYD2PUU:273973fe-7553-4a5b-9d07-dc81c9ca8382",
            "Sns": {
                "Type": "Notification",
                "MessageId": "6fba6511-367e-54a6-b1c9-3265fb481d39",
                "TopicArn": "arn:aws:sns:us-east-1:253121499730:image-builder9-PipelineTopic-KAPDAYYD2PUU",
                "Subject": null,
                "Message": "{\n  \"versionlessArn\": \"arn:aws:imagebuilder:us-east-1:253121499730:image/image-builder9-recipe\",\n  \"semver\": 1152921504606846979,\n  \"arn\": \"arn:aws:imagebuilder:us-east-1:253121499730:image/image-builder9-recipe/0.1.0/3\",\n  \"name\": \"image-builder9-Recipe\",\n  \"version\": \"0.1.0\",\n  \"buildVersion\": 3,\n  \"state\": {\n    \"status\": \"AVAILABLE\"\n  },\n  \"platform\": \"Linux\",\n  \"imageRecipe\": {\n    \"arn\": \"arn:aws:imagebuilder:us-east-1:253121499730:image-recipe/image-builder9-recipe/0.1.0\",\n    \"name\": \"image-builder9-Recipe\",\n    \"version\": \"0.1.0\",\n    \"components\": [\n      {\n        \"componentArn\": \"arn:aws:imagebuilder:us-east-1:253121499730:component/image-builder9-bootstrap/0.1.0/1\"\n      }\n    ],\n    \"platform\": \"Linux\",\n    \"parentImage\": \"ami-0742dbb6cdf78ac94\",\n    \"blockDeviceMappings\": [],\n    \"dateCreated\": \"Jun 30, 2020 4:28:51 AM\",\n    \"tags\": {\n      \"internalId\": \"312ab425-b082-4ca0-80a6-f5cb803ec460\",\n      \"resourceArn\": \"arn:aws:imagebuilder:us-east-1:253121499730:image-recipe/image-builder9-recipe/0.1.0\"\n    },\n    \"accountId\": \"253121499730\"\n  },\n  \"sourcePipelineArn\": \"arn:aws:imagebuilder:us-east-1:253121499730:image-pipeline/image-builder9-pipeline\",\n  \"infrastructureConfiguration\": {\n    \"arn\": \"arn:aws:imagebuilder:us-east-1:253121499730:infrastructure-configuration/image-builder9-infrastructure\",\n    \"name\": \"image-builder9-Infrastructure\",\n    \"instanceTypes\": [\n      \"m5.large\"\n    ],\n    \"instanceProfileName\": \"image-builder9-InstanceProfile-EHRCBQTN4MYB\",\n    \"securityGroupIds\": [\n      \"sg-010961c727aa582f1\"\n    ],\n    \"subnetId\": \"subnet-0aa5240b704a37e0d\",\n    \"tags\": {\n      \"internalId\": \"519f9ca0-8630-40ec-8c85-48f1d9d8588e\",\n      \"resourceArn\": \"arn:aws:imagebuilder:us-east-1:253121499730:infrastructure-configuration/image-builder9-infrastructure\"\n    },\n    \"terminateInstanceOnFailure\": true,\n    \"snsTopicArn\": \"arn:aws:sns:us-east-1:253121499730:image-builder9-PipelineTopic-KAPDAYYD2PUU\",\n    \"dateCreated\": \"Jun 30, 2020 4:31:07 AM\",\n    \"dateUpdated\": \"Jun 30, 2020 4:44:48 AM\",\n    \"accountId\": \"253121499730\"\n  },\n  \"imageTestsConfigurationDocument\": {\n    \"imageTestsEnabled\": true,\n    \"timeoutMinutes\": 720\n  },\n  \"distributionConfiguration\": {\n    \"arn\": \"arn:aws:imagebuilder:us-east-1:253121499730:distribution-configuration/image-builder9-distribution\",\n    \"name\": \"image-builder9-Distribution\",\n    \"dateCreated\": \"Jun 30, 2020 4:29:01 AM\",\n    \"dateUpdated\": \"Jun 30, 2020 4:50:00 AM\",\n    \"distributions\": [\n      {\n        \"region\": \"us-east-1\",\n        \"amiDistributionConfiguration\": {}\n      }\n    ],\n    \"tags\": {\n      \"internalId\": \"e0a08609-3d1d-4023-afbd-3b68a056ba60\",\n      \"resourceArn\": \"arn:aws:imagebuilder:us-east-1:253121499730:distribution-configuration/image-builder9-distribution\"\n    },\n    \"accountId\": \"253121499730\"\n  },\n  \"dateCreated\": \"Jun 30, 2020 4:51:30 AM\",\n  \"outputResources\": {\n    \"amis\": [\n      {\n        \"region\": \"us-east-1\",\n        \"image\": \"ami-09ad59d64cfd44c8f\",\n        \"name\": \"image-builder9-Recipe 2020-06-30T04-52-02.140Z\"\n      }\n    ]\n  },\n  \"buildExecutionId\": \"2c49d1bd-6370-4b00-842c-4c5c4657fe59\",\n  \"testExecutionId\": \"db6c9aad-3ded-4ff4-a6fb-9e277ffc4a52\",\n  \"distributionJobId\": \"0f84f324-be67-4e0f-8d51-f5d14712792c\",\n  \"integrationJobId\": \"2d11083c-be3f-463f-8440-01ce312ebd90\",\n  \"accountId\": \"253121499730\",\n  \"enhancedImageMetadataEnabled\": false,\n  \"tags\": {\n    \"internalId\": \"58d421cc-1717-49ea-8f29-ea1ede81c59f\",\n    \"resourceArn\": \"arn:aws:imagebuilder:us-east-1:253121499730:image/image-builder9-recipe/0.1.0/3\"\n  }\n}",
                "Timestamp": "2020-06-30T05:17:42.399Z",
                "SignatureVersion": "1",
                "Signature": "CDzlIrkxz1g2pw4RZJPHiOYGxJuekhU/SiaO54nEdaV141p1ZolbT9G2q1MtsbL953RY8xe0gj/ucuPp62x3FprhBPaPTupyqIbTN8F24CwYv6ISHXxigCAY1MQeBu3NyALdp3cR4OGk56Mm4T1QoiD2a370PluoMD2xa7eueX/M6qD7NbsuA+iFU1+GrTWew9zP6n9O7DZwfdeDifne8Vwbxp4eL6bgJmIWPM2/gSKiU12trmpGeuQB4KmQuxM+poSF9LYOEwmwl1NjyQxzno/Xm+1WE29AkLo+3NhLghSkqcMliGw6d6SpOFsKb7dxeskgIKlcK/JnF9MgnOJ/dw==",
                "SigningCertUrl": "https://sns.us-east-1.amazonaws.com/SimpleNotificationService-a86cb10b4e1f29c941702d737128f7b6.pem",
                "UnsubscribeUrl": "https://sns.us-east-1.amazonaws.com/?Action=Unsubscribe&SubscriptionArn=arn:aws:sns:us-east-1:253121499730:image-builder9-PipelineTopic-KAPDAYYD2PUU:273973fe-7553-4a5b-9d07-dc81c9ca8382",
                "MessageAttributes": {}
            }
        }
    ]
}
```

Message Schema:

```
{
  versionlessArn: 'arn:aws:imagebuilder:us-east-1:253121499730:image/image-builder9-recipe',
  semver: 1152921504606847000,
  arn: 'arn:aws:imagebuilder:us-east-1:253121499730:image/image-builder9-recipe/0.1.0/3',
  name: 'image-builder9-Recipe',
  version: '0.1.0',
  buildVersion: 3,
  state: { status: 'AVAILABLE' },
  platform: 'Linux',
  imageRecipe: {
    arn: 'arn:aws:imagebuilder:us-east-1:253121499730:image-recipe/image-builder9-recipe/0.1.0',
    name: 'image-builder9-Recipe',
    version: '0.1.0',
    components: [
		{
     		componentArn: 'arn:aws:imagebuilder:us-east-1:253121499730:component/image-builder9-bootstrap/0.1.0/1'
    	}
    ],
    platform: 'Linux',
    parentImage: 'ami-0742dbb6cdf78ac94',
    blockDeviceMappings: [],
    dateCreated: 'Jun 30, 2020 4:28:51 AM',
    tags: {
      internalId: '312ab425-b082-4ca0-80a6-f5cb803ec460',
      resourceArn: 'arn:aws:imagebuilder:us-east-1:253121499730:image-recipe/image-builder9-recipe/0.1.0'
    },
    accountId: '253121499730'
  },
  sourcePipelineArn: 'arn:aws:imagebuilder:us-east-1:253121499730:image-pipeline/image-builder9-pipeline',
  infrastructureConfiguration: {
    arn: 'arn:aws:imagebuilder:us-east-1:253121499730:infrastructure-configuration/image-builder9-infrastructure',
    name: 'image-builder9-Infrastructure',
    instanceTypes: [ 'm5.large' ],
    instanceProfileName: 'image-builder9-InstanceProfile-EHRCBQTN4MYB',
    securityGroupIds: [ 'sg-010961c727aa582f1' ],
    subnetId: 'subnet-0aa5240b704a37e0d',
    tags: {
      internalId: '519f9ca0-8630-40ec-8c85-48f1d9d8588e',
      resourceArn: 'arn:aws:imagebuilder:us-east-1:253121499730:infrastructure-configuration/image-builder9-infrastructure'
    },
    terminateInstanceOnFailure: true,
    snsTopicArn: 'arn:aws:sns:us-east-1:253121499730:image-builder9-PipelineTopic-KAPDAYYD2PUU',
    dateCreated: 'Jun 30, 2020 4:31:07 AM',
    dateUpdated: 'Jun 30, 2020 4:44:48 AM',
    accountId: '253121499730'
  },
  imageTestsConfigurationDocument: { imageTestsEnabled: true, timeoutMinutes: 720 },
  distributionConfiguration: {
    arn: 'arn:aws:imagebuilder:us-east-1:253121499730:distribution-configuration/image-builder9-distribution',
    name: 'image-builder9-Distribution',
    dateCreated: 'Jun 30, 2020 4:29:01 AM',
    dateUpdated: 'Jun 30, 2020 4:50:00 AM',
    distributions: [
    	{
    		region: 'us-east-1',
    		amiDistributionConfiguration: {}
    	}
    ],
    tags: {
      internalId: 'e0a08609-3d1d-4023-afbd-3b68a056ba60',
      resourceArn: 'arn:aws:imagebuilder:us-east-1:253121499730:distribution-configuration/image-builder9-distribution'
    },
    accountId: '253121499730'
  },
  dateCreated: 'Jun 30, 2020 4:51:30 AM',
  outputResources: {
  	amis: [
    	{
      		region: 'us-east-1',
      		image: 'ami-09ad59d64cfd44c8f',
      		name: 'image-builder9-Recipe 2020-06-30T04-52-02.140Z'
    	}
  	]
  },
  buildExecutionId: '2c49d1bd-6370-4b00-842c-4c5c4657fe59',
  testExecutionId: 'db6c9aad-3ded-4ff4-a6fb-9e277ffc4a52',
  distributionJobId: '0f84f324-be67-4e0f-8d51-f5d14712792c',
  integrationJobId: '2d11083c-be3f-463f-8440-01ce312ebd90',
  accountId: '253121499730',
  enhancedImageMetadataEnabled: false,
  tags: {
    internalId: '58d421cc-1717-49ea-8f29-ea1ede81c59f',
    resourceArn: 'arn:aws:imagebuilder:us-east-1:253121499730:image/image-builder9-recipe/0.1.0/3'
  }
}
```