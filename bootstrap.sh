#!/bin/sh

echo hello from s3 bootstrap.sh

# Example of file name munging for a git-mirror
GIT_SSH_COMMAND='ssh -i /tmp/secrets/id_rsa -o IdentitiesOnly=yes' git clone git@github.com:keithduncan/hello-world-private.git /var/lib/buildkite-agent/git-mirrors/git-github-com-keithduncan-hello-world-private-git

# Verify the repository contents are present
cat /var/lib/buildkite-agent/git-mirrors/git-github-com-keithduncan-hello-world-private-git/secrets