#! /usr/bin/bash
echo "Running $0"
me=$(readlink -f $0)
mypath=`dirname $me`
cd $mypath
echo "running in $PWD"

fn="99-ps.rules"
rm "/etc/udev/rules.d/$fn"
ln -s "$mypath/src/$fn" "/etc/udev/rules.d/$fn" 
chown -h root:root "/etc/udev/rules.d/$fn"
udevadm control --reload

fn="fluidsynth@.service"
rm "/etc/systemd/user/$fn"
ln -s "$mypath/src/$fn" "/etc/systemd/user/$fn"
chown -h root:root "/etc/systemd/user/$fn"

fn="fluidsynth"
rm "/etc/default/$fn"
ln -s "$mypath/src/$fn" "/etc/default/$fn"
chown -h root:root "/etc/default/$fn"
