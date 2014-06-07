#!/system/bin/sh

# No path is set up at this point so we have to do it here.
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

setprop gsm.version.baseband `strings /dev/block/mmcblk0p13 | grep -E 'P772|P740' | grep -m1 -e '[^\ ]\{12,\}'`
