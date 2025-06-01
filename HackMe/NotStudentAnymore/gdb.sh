#!/bin/sh
# cp $1 input.txt
env -i PWD=`pwd` gdb $(readlink -f main)
# rm input.txt
