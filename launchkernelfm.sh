#!/bin/bash

######################################################################
# update the kernel source & launch the find process and the stream  #
######################################################################
cd /data/pnode/algo/linux-stable
git pull

cd /data/pnode/algo/kernel-radio
./launchkernelfind.sh &

sleep 1

while true
do
	arecord -c 2 -f cd -r 48000 -D hw:1,1,0 | sox -t raw --ignore-length -r 44100 -e signed-integer -b 16  -c 2 - -t ogg -C 5 - |oggfwd -d 'Stable Linux kernel source code lecture' -g Generative -n Kernel-radio -u https://git.kernel.org/pub/scm/linux/kernel/git/stable/ 212.83.128.6 80 ****** kernel-lecture.ogg
done

