#!/bin/sh

echo hello from s3 bootstrap.sh

mkdir -p ~/.ssh
echo "github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==" >> ~/.ssh/known_hosts

# Example of file name munging for a git-mirror
GIT_SSH_COMMAND='ssh -i /tmp/secrets/id_rsa -o IdentitiesOnly=yes' git clone git@github.com:keithduncan/hello-world-private.git /var/lib/buildkite-agent/git-mirrors/git-github-com-keithduncan-hello-world-private-git

# Verify the repository contents are present
cat /var/lib/buildkite-agent/git-mirrors/git-github-com-keithduncan-hello-world-private-git/secrets