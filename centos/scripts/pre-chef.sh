#!/bin/bash

set -e

###### GLOBAL
KNIFE_PATH="/usr/bin/knife"
SITE_DWNLD_CMD="$KNIFE_PATH cookbook site download"


if which curl; then
		DWNLD_MGR='curl -L'
elif which wget; then
		DWNLD_MGR='wget -qO-'
else
		echo "no download manager found. exiting..."
		exit
fi


if which chef-solo; then
		echo 'chef-solo already installed..'
else
    	## install chef-solo
        echo 'vagrant' | sudo -S bash -c "$DWNLD_MGR https://www.opscode.com/chef/install.sh | bash"  
fi

## install recipes

declare -a recipes
recipes=(ark java ntp cron ruby_build git build-essential yum yum-epel runit windows dmg ohai)


cd /tmp

for recipe in ${recipes[@]}
do
        echo  $SITE_DWNLD_CMD $recipe
        $SITE_DWNLD_CMD $recipe
        tar -xvzf $recipe*.tar.gz --owner root --group root --no-same-owner
done