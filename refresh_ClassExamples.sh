#!/bin/sh
#
# refresh_ClassExamples.sh
#
# USE WITH CARE!
#
# This unix shell script deletes your locally cloned version 
# of ClassExamples and clones ClassExamples again from git.
#
# This means that ANY files that you created or modified 
# in ClassExamples AND its subdirectories/folders MAY be deleted.
# The code now does a backup that is then compressed.
#
# Suggested usage (first time around)
# echo $HOME
# cp refresh_ClassExamples.sh $HOME       (Copies refresh_ClassExamples.sh from here to $HOME/Class_Examples.sh)
# cd $HOME
# pwd
# ls ClassExamples                       # This is the directory that will be deleted
# chmod +x $HOME/refresh_ClassExamples.sh   (This makes $HOME/refresh_ClassExamples.sh executable)
# $HOME/refresh-ClassExamples.sh          (Runs this code from $HOME direc)
# 
cd $HOME

echo '$HOME = '$HOME
echo 'Will delete the '$HOME/ClassExamples 'directory'

DATE=`date "+%b-%d-%Y_%T-%Z"`
echo $DATE

echo 'Making a backup'
cp -rp $HOME/ClassExamples ClassExamples_${DATE}
gzip ClassExamples_${DATE}

rm -rf $HOME/ClassExamples
echo 'ClassExamples directory deleted'

git clone https://github.com/grahamwwilson/ClassExamples.git
echo 'ClassExamples directory recloned from git'

exit
