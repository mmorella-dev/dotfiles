#! /usr/bin/env bash
sudo -v # get permissions
curl https://raw.githubusercontent.com/samrocketman/git-identity-manager/v0.9/git-idm | sudo tee /usr/local/bin/git-idm
sudo chmod +x /usr/local/bin/git-idm

