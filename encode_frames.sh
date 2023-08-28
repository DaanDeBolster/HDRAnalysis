#!/bin/sh

NAME=$1
INPUT=$2
CRF=$3
NUMBER_OF_FRAMES=240

# Build HDRTools code (if changes were made)
cd HDRTools/build 
make
cd ../..

# Make directories for IO
mkdir -p out
mkdir -p out/$NAME
mkdir -p out/$NAME/CRF_"$CRF"
mkdir -p out/$NAME/CRF_"$CRF"/frames_wcg
mkdir -p out/$NAME/CRF_"$CRF"/frames_bt709
mkdir -p out/$NAME/CRF_"$CRF"/frames_sim2

# Apply compression
if [ $CRF == none ]
then
    ffmpeg -y -i $INPUT -c:v libx265 -x265-params "crf=0:lossless=1:qp=0" -preset slow out/$NAME/CRF_"$CRF"/wcg_full.mkv > out/$NAME/CRF_"$CRF"/_log_x265.txt
else
    ffmpeg -y -i $INPUT -c:v libx265 -x265-params "hdr10-opt=1:log-level=3" -crf $CRF -preset slow out/$NAME/CRF_"$CRF"/wcg_full.mkv > out/$NAME/CRF_"$CRF"/_log_x265.txt
fi
ffmpeg -i out/$NAME/CRF_"$CRF"/wcg_full.mkv -compression_algo raw -start_number 0 out/$NAME/CRF_"$CRF"/frames_wcg/%05d.tif

# Tonemapping
./HDRTools/build/bin/HDRConvert -f HDRTools/cfg/HDRConvertToTIFF.cfg -p SourceFile="out/$NAME/CRF_"$CRF"/frames_wcg/%05d.tif" -p outputfile="out/$NAME/CRF_"$CRF"/frames_bt709/%05d.tif" -p NumberOfFrames=$NUMBER_OF_FRAMES -p SourceBitDepthCmp0=16 -p SourceBitDepthCmp1=16 -p SourceBitDepthCmp2=16 -p SourceTransferFunction=1 -p OutputBitDepthCmp0=16 -p OutputBitDepthCmp1=16 -p OutputBitDepthCmp2=16 -p SourceChromaFormat=1 -p SourceTransferFunction=1 -p OutputTransferFunction=1 -p OutputColorPrimaries=0

# Tonemapping + Sim2 encoding
./HDRTools/build/bin/HDRConvert -f HDRTools/cfg/HDRConvertToTIFF.cfg -p SourceFile="out/$NAME/CRF_"$CRF"/frames_wcg/%05d.tif" -p outputfile="out/$NAME/CRF_"$CRF"/frames_sim2/%05d.tif" -p NumberOfFrames=$NUMBER_OF_FRAMES -p SourceBitDepthCmp0=16 -p SourceBitDepthCmp1=16 -p SourceBitDepthCmp2=16 -p SourceTransferFunction=1 -p OutputBitDepthCmp0=16 -p OutputBitDepthCmp1=16 -p OutputBitDepthCmp2=16 -p SourceChromaFormat=1 -p SourceTransferFunction=1 -p OutputTransferFunction=0 -p SourceSampleRange=1 -p outputSampleRange=1 -p ToneMappingMode=0 -p OutputColorPrimaries=0 -p SetSim2=1

exit 0
