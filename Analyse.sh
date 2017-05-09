#!/bin/bash
#***************************************************
#for ffmpeg:
# install:
# git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
# cd FFMPEG
# ./configure $yout option
# make install
#***************************************************


VideoDouYin="ios_android_douyin.mp4"
VideoMuse="ios_muse_broswer.mp4"

BitStreamDouYin="${VideoDouYin}.ffmpeg_trans.264"
BitStreamMuse="${VideoMuse}.ffmpeg_trans.264"

YUVDouYin="${VideoDouYin}.JM.dec.yuv"
YUVMuse="${VideoMuse}.JM.dec.yuv"

git clean -fdx

ffmpeg -i ${VideoDouYin} -vbsf h264_mp4toannexb -vcodec copy -an ${BitStreamDouYin}  >FFMPEGTrans.log   2>&1
ffmpeg -i ${VideoMuse} -vbsf h264_mp4toannexb -vcodec copy   -an ${BitStreamMuse}    >>FFMPEGTrans.log  2>&1

./JMDecoder -p "InputFile=${BitStreamDouYin}" -p "OutputFile=${YUVDouYin}" >JMDecoded.log
./JMDecoder -p "InputFile=${BitStreamMuse}"   -p "OutputFile=${YUVMuse}"   >>JMDecoded.log

