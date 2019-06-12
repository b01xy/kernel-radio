#!/bin/bash

##########################################################################
# speach sysnthesys of the filename and its content                      #
##########################################################################
# usage: ./espeakernel.sh PATH_TO_FILE                        `          #
##########################################################################
echo $(basename "$1") | espeak -a 100 -p 59 -s 140 -g 7 -v mb-us1 --stdin --stdout| sox -t raw --ignore-length -r 16000 -e signed-integer -b 16 -c 1 - -t wav - channels 2 rate -L -s 48000|aplay -c 2 -D hw:1,0,0

sleep 0.5
espeak -a 100 -p 59 -s 140 -g 7 -v mb-us1 -f "$1" --stdout| sox -t raw --ignore-length -r 16000 -e signed-integer -b 16 -c 1 - -t wav - channels 2 rate -L -s 48000|aplay -c 2 -D hw:1,0,0
exit 0

