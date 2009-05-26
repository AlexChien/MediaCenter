#!/bin/bash
####################################################
#	This script will auto link $2 to $1
#	Usage:	script real_dir link_dir
#	
#	Function:	auto link $2 to $1
#
#	Author:	Jacky Xu
#	Last Modify:	2009-02-10
####################################################

## $1 is read_dir like /usr/local/webservice/htdocs/enjoyoung/shared/assets
## $2 is link_dir like /usr/local/webservice/htdocs/enjoyoung/current/public/images/assets
## $3 is previous_release
## $4 is release_name

real_dir=$1
link_dir=$2
pre_release=$3
current_release=$4
backup_dir='/home/mongrel/backup'

echo "real dir is $real_dir" >> $backup_dir/relink.log
echo "link dir is $link_dir" >> $backup_dir/relink.log
echo "pre release is $pre_release" >> $backup_dir/relink.log
echo "current release is $current_release" >> $backup_dir/relink.log

if [ ! -d $real_dir ]
then
	echo "create $real_dir"  >> $backup_dir/relink.log
	mkdir $real_dir
else
	echo "$real_dir exist"  >> $backup_dir/relink.log
fi

if [ -d $link_dir ]
then
	echo "$link_dir is a directory, move it to $backup_dir and rename to assets_$current_release"  >> $backup_dir/relink.log
	mv $link_dir $backup_dir/assets_$current_release
fi
echo "link $real_dir to $link_dir"  >> $backup_dir/relink.log
ln -s $real_dir $link_dir

####
#mongrel_deploy='/usr/local/webservice/htdocs/enjoyoung/current/config/mongrel_cluster.yml'
#mongrel_real='/usr/local/webservice/htdocs/enjoyoung/shared/config/mongrel_cluster.yml'

#if [ -f "${mongrel_deploy}" ]
#then
#	rm -rf ${mongrel_deploy}
#fi

#ln -s $mongrel_real $mongrel_deploy


