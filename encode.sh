#!/bin/sh

# This script contains the pipeline to encode a HDR video to the sim2 display format using HDRTools, as well as to provide metrics:
# - HEVC encoding (optional)
# - BT2020 to BT709 tonemapping
# - Sim2 encoding
#   - The code is added to HDRTools and can be found at "HDRTools/common/inc/Sim2Coding.H" and "HDRTools/common/src/Sim2Coding.cpp"
#   - Sim2 encoding is disabled by default, it can be enabled by running HDRConvert and adding the option "-p SetSim2=1"
#   - Sim2 encoding is only supported for .tif inputs 
# - The script can be run trough the following command: "bash encode.sh <CRF> <processing options> <compression options>""
#   - <CRF> is the constant rate factor for libx265 encoding ("none" for lossless compression)
#   - <processing options> is used to specify extra ffmpeg options ("none" for no extra options)
#   - <compression options> is used to specify extra libx265 encoding options ("none" for no extra options)

# Specify input: 
# - At NAME, specify the name the output files will be given
# - At INPUT, specify the path where the input video is located preceded by -i, as well as optional FFMPEG input parameters
# - At NUMBER_OF_FRAMES, specify the number of frames to encode

NAME="Cosmos"
INPUT="-r 24 -colorspace bt2020nc -color_trc smpte2084 -color_primaries bt2020 -s 1920x1080 -pixel_format yuv420p10le -i IO/src/Cosmos/Cosmos1_1920x1080_BT2100_PQ_24fps_420.yuv"
NUMBER_OF_FRAMES=240

# NAME="Starting"
# INPUT="-colorspace bt2020nc -color_trc smpte2084 -color_primaries bt2020 -s 1920x1080 -pixel_format yuv420p10le -i ../testFiles/src/Starting/Starting_1920x1080p_50_10b_pq_709_ct2020_420_rev1.yuv"
# NUMBER_OF_FRAMES=500

# NAME="Joker2019"
# INPUT="-i IO/src/Joker2019/Joker2019_10seccut.mkv"
# NUMBER_OF_FRAMES=240

# NAME="Sunrise"
# INPUT="-colorspace bt2020nc -color_trc smpte2084 -color_primaries bt2020 -s 1920x1080 -pixel_format yuv420p10le -i ../testFiles/src/Sunrise/SunRise_1920x1080p_25_10b_pq_709_ct2020_420.yuv"
# NUMBER_OF_FRAMES=200

# NAME="Colors"
# INPUT="-i IO/src/Colors/240-1000nits-MaxCLL-1000-MDL-1000_2Sec.mp4"
# NUMBER_OF_FRAMES=48

# NAME="Grayramp"
# INPUT="-i IO/src/Grayramp/Gray_Ramp_10Knits_2Sec.mp4"
# NUMBER_OF_FRAMES=48

CRF=$1
POSTPROC=$2
INLOOP="$3"
DIFF=1      # Set to 0 to disable the generation of difference frames
METRICS=1   # Set to 0 to disable objective analysis 

# # Build HDRTools code (if changes the source code were made)
# cd HDRTools/build 
# make
# cd ../..

# Make directories for IO
mkdir -p IO
mkdir -p IO/src
mkdir -p IO/src/$NAME
mkdir -p IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP
mkdir -p IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/frames
mkdir -p IO/sim2
mkdir -p IO/sim2/$NAME
mkdir -p IO/sim2/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP
mkdir -p IO/sim2/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/frames

# Apply compression
if [ $CRF == none ]
then
    if [ $POSTPROC == none ]
    then
        ffmpeg -y $INPUT -c:v libx265 -x265-params "crf=0:lossless=1:qp=0" -preset slow IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_"$INLOOP"/wcg_full.mkv
    else
        ffmpeg -y $INPUT -c:v libx265 -x265-params "crf=0:lossless=1:qp=0" -preset slow -vf $POSTPROC IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_"$INLOOP"/wcg_full.mkv
    fi
else
    if [ $POSTPROC == none ] && [ $INLOOP == none ]
    then
        ffmpeg -y $INPUT -c:v libx265 -x265-params "log-level=3" -crf $CRF -preset slow IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_"$INLOOP"/wcg_full.mkv
    elif [ $POSTPROC == none ]
    then
        ffmpeg -y $INPUT -c:v libx265 -x265-params "$INLOOP:log-level=3" -crf $CRF -preset slow IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_"$INLOOP"/wcg_full.mkv
        
    elif [ $INLOOP == none ]
    then
        ffmpeg -y $INPUT -c:v libx265 -x265-params "log-level=3" -crf $CRF -preset slow -vf $POSTPROC IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_"$INLOOP"/wcg_full.mkv
    else
        ffmpeg -y $INPUT -c:v libx265 -x265-params "$INLOOP:log-level=3" -crf $CRF -preset slow -vf $POSTPROC IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_"$INLOOP"/wcg_full.mkv
    fi
fi
ffmpeg -i IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_"$INLOOP"/wcg_full.mkv  -compression_algo raw -start_number 0 IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/frames/wcg_%05d.tif

# Tonemap from BT2020 to BT709
./HDRTools/build/bin/HDRConvert -f HDRTools/cfg/HDRConvertToTIFF.cfg -p SourceFile="IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/frames/wcg_%05d.tif" -p outputfile="IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/frames/bt709_%05d.tif" -p NumberOfFrames=$NUMBER_OF_FRAMES -p SourceBitDepthCmp0=16 -p SourceBitDepthCmp1=16 -p SourceBitDepthCmp2=16 -p SourceTransferFunction=1 -p OutputBitDepthCmp0=16 -p OutputBitDepthCmp1=16 -p OutputBitDepthCmp2=16 -p SourceChromaFormat=1 -p SourceTransferFunction=1 -p OutputTransferFunction=1 -p OutputColorPrimaries=0
ffmpeg -y -r 24 -i IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/frames/bt709_%05d.tif -preset veryslow -c:v libx264 -x264-params qp=0 IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/bt709_full.mkv

# Apply Sim2 encoding
./HDRTools/build/bin/HDRConvert -f HDRTools/cfg/HDRConvertToTIFF.cfg -p SourceFile="IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/frames/wcg_%05d.tif" -p outputfile="IO/sim2/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/frames/%05d.tif" -p NumberOfFrames=$NUMBER_OF_FRAMES -p SourceBitDepthCmp0=16 -p SourceBitDepthCmp1=16 -p SourceBitDepthCmp2=16 -p SourceTransferFunction=1 -p OutputBitDepthCmp0=16 -p OutputBitDepthCmp1=16 -p OutputBitDepthCmp2=16 -p SourceChromaFormat=1 -p SourceTransferFunction=1 -p OutputTransferFunction=0 -p SourceSampleRange=1 -p outputSampleRange=1 -p ToneMappingMode=0 -p OutputColorPrimaries=0 -p SetSim2=1
ffmpeg -y -r 24 -i IO/sim2/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/frames/%05d.tif -preset veryslow -c:v libx264 -x264-params qp=0 IO/sim2/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/full.mkv

# When metrics or difference frames are enabled 
if [ $DIFF != 0 ] && [ $METRICS != 0 ] && [ ! -e IO/src/$NAME/HEVC_CRF_none_Filter_none_InLoop_none/bt709_full.mkv ]
then
    echo " " && echo "Processing reference video reference frames" && echo " "
    bash encode.sh none none none
fi

# Metrics
if [[ $METRICS != 0 ]]
then
    ./HDRTools/build/bin/HDRMetrics -f HDRTools/cfg/HDRMetrics.cfg -p Input0File="IO/src/$NAME/HEVC_CRF_none_Filter_none_InLoop_none/frames/wcg_%05d.tif" -p Input1File="IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/frames/wcg_%05d.tif" -p NumberOfFrames=$NUMBER_OF_FRAMES -p Input0ChromaFormat=1 -p Input1ChromaFormat=1 -p Input0SampleRange=1 -p Input1SampleRange=1 -p Input0ColorPrimaries=1 -p Input1ColorPrimaries=1 -p EnableTFPSNR=0 -p EnablePSNR=1 -p EnableSSIM=1 > IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/_metrics.txt
    ./HDRTools/build/bin/HDRVQM     -f HDRTools/cfg/HDRVQM.cfg     -p Input0File="IO/src/$NAME/HEVC_CRF_none_Filter_none_InLoop_none/frames/wcg_%05d.tif" -p Input1File="IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/frames/wcg_%05d.tif" -p NumberOfFrames=$NUMBER_OF_FRAMES -p Input0ChromaFormat=1 -p Input1ChromaFormat=1 -p Input0SampleRange=1 -p Input1SampleRange=1 -p Input0ColorPrimaries=1 -p Input1ColorPrimaries=1 -p Input0TransferFunction=1 -p Input1TransferFunction=1  >  IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/_metrics_HDR.txt
    ffprobe IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/wcg_full.mkv -show_frames > IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/_log_frametype.txt
fi

# Difference frames
if [[ $DIFF != 0 ]]
then
    mkdir -p IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/diff_frames
    python3 diff_frames.py $NUMBER_OF_FRAMES IO/src/$NAME/HEVC_CRF_none_Filter_none_InLoop_none/frames/  IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/frames/ IO/src/$NAME/HEVC_CRF_"$CRF"_Filter_"$POSTPROC"_InLoop_$INLOOP/diff_frames/
fi

exit 0
