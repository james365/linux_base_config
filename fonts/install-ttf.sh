#!/bin/bash 

cur_dir=$PWD
ttffile=$1
if [ x"$ttffile" == x"" ]
then
    echo "USAGE: $0 tff-filename"
    exit 1
fi

cd ~
[ -d .fonts ] || mkdir .fonts
cp $cur_dir/$ttffile .fonts/
cd .fonts/
mkfontscale
mkfontdir
fc-cache -fv .

[ $? == 0 ] && echo "Install $1 fonts OK!"
exit 0

