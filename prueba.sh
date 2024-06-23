#!/bin/bash
for user in $(cut -d: -f1 /etc/passwd); do
    home_dir=$(eval echo ~$user)
    if [ -d $home_dir ]; then
	   du -sh $home_dir 2>/dev/null | awk -v user=$user '{print user": "$1}'
    fi
done
