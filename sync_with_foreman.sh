#!/bin/bash

git clone https://github.com/theforeman/foreman-installer-modulesync.git
rsync -a --progress --exclude=moduleroot/.travis.yml --exclude=moduleroot/CONTRIBUTING.md --exclude=managed_modules.yml --exclude modulesync.yml foreman-installer-modulesync/* .

rm -rf foreman-installer-modulesync

# Foreman still supports 2.7, we don't
sed -i -e 's/>= 2.7/~> 3.5/g' moduleroot/Gemfile

# Update URL's to our fork
find ./moduleroot -type f -exec sed -i -e 's?https://github.com/theforeman/foreman-installer-modulesync?https://github.com/Katello/foreman-installer-modulesync?g' {} \;


