#!/bin/bash
#-------------------------
# blur script [by nathan lachenmyer]
#
# uses imagemagick to blur all .tif files
#-------------------------


for file in *.png;
do
    echo "Processing $file...";
    #blur, and create a temporary intermediate file
    convert $file -channel RGBA -blur 0x$1 b_$file;
    #create a transparent mask, create a temporary file
    convert $file -colorspace HSB -channel B -separate -negate m_$file;
    convert $file -alpha Off m_$file -compose CopyOpacity -composite a_$file;
    #composite the images
    convert b_$file a_$file -composite c_$file;
done

./clean.sh
