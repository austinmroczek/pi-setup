#!/bin/bash

# setup SSH key
mkdir ~/.ssh
chmod 700 ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAk5qQWUPKfPlZoskXAHD1Yl0iSOCfavAoGeCYmVzer1oBgSHsP8B6rgiujHqJWu0kJMKk1xMjUGj04X5bO6FAWqEdoggMlx2M0eb8hF2CQafSzlcWXj3Vi4YtVdv+nLZn+3BFXz0FdCgeXfDlvVbazI6BES2ByAB3tzgWIijz6eDEGwdQB/MjIvSlMtAIKaBCTSNzKLBEXpp7zXN2HJyfTR6YDGEqfKHHOkCTtFDfJyc7NMnw/NQhUKFyrUZnKFTVfWy06NaDXJ12pFWCCA0U3iBUS22shqVZdhYP7xnMgAX/wrwRBgD/SNnUabpqIv/0D1t/ymaYPYCGXq7DT48nJw== rsa-key-20190124" > ~/.ssh/authorized_keys
chmod 700 ~/.ssh/authorized_keys

# install useful stuff
apt update
apt install git

