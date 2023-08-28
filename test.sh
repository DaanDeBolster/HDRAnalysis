#!/bin/sh

mkdir -p results
mkdir -p results/SiTi
mkdir -p plots
mkdir -p plots/preanalysis

# Pre-analysis
for (( SEQ=1; SEQ <= 8; SEQ=SEQ+1 )); 
do 
    siti-tools -r full -c pq -m hdr10 -b 10 -f csv in/seq"$SEQ".mkv > results/SiTi/seq"$SEQ".csv
done 
siti-tools -r full -c pq -m hdr10 -b 10 -f csv in/training.mkv > results/SiTi/training.csv

python3 pre_analysis.py 

for crf in none 15 20 25 30 35 
do
    for name in training seq1 seq2 seq3 seq4 seq5 seq6 seq7 seq8 seq9
    do  
        # Generate frames
        bash encode_frames.sh $name in/$name.mkv $crf

        if [ "$crf" != "none" ]; then
            # Perform objective analysis
            ./HDRTools/build/bin/HDRMetrics -f HDRTools/cfg/HDRMetrics.cfg -p Input0File="out/$name/CRF_none/frames_wcg/%05d.tif" -p Input1File="out/$name/CRF_$crf/frames_wcg/%05d.tif" -p NumberOfFrames=240 -p Input0ChromaFormat=1 -p Input1ChromaFormat=1 -p Input0SampleRange=1 -p Input1SampleRange=1 -p Input0ColorPrimaries=1 -p Input1ColorPrimaries=1 -p EnableTFPSNR=0 -p EnablePSNR=1 -p EnableSSIM=1        > out/$name/CRF_$crf/_PSNR_SSIM.txt
            ./HDRTools/build/bin/HDRVQM     -f HDRTools/cfg/HDRVQM.cfg     -p Input0File="out/$name/CRF_none/frames_wcg/%05d.tif" -p Input1File="out/$name/CRF_$crf/frames_wcg/%05d.tif" -p NumberOfFrames=240 -p Input0ChromaFormat=1 -p Input1ChromaFormat=1 -p Input0SampleRange=1 -p Input1SampleRange=1 -p Input0ColorPrimaries=1 -p Input1ColorPrimaries=1 -p Input0TransferFunction=1 -p Input1TransferFunction=1  > out/$name/CRF_$crf/_HDRVQM.txt
            ffmpeg-quality-metrics out/$name/CRF_$crf/wcg_full.mkv out/$name/CRF_none/wcg_full.mkv -m vif  > out/$name/CRF_$crf/_vif.json
            ffmpeg-quality-metrics out/$name/CRF_$crf/wcg_full.mkv out/$name/CRF_none/wcg_full.mkv -m vmaf > out/$name/CRF_$crf/_vmaf.json
            ffprobe out/$name/CRF_$crf/wcg_full.mkv -show_frames > IO/$name/CRF_$crf/_log_frametype.txt

            # Generate difference frames
            mkdir -p out/$name/CRF_$crf/diff_frames
            python3 diff_frames.py 240 out/$name/CRF_none out/$name/CRF_$crf out/$name/CRF_$crf/diff_frames 
        fi
    done
done

# Generate plots and tables regarding quality analysis
mkdir -p plots/results
python3 interpret_results.py 

mkdir -p plots/sureal
mkdir -p plots/sureal/images
sureal --dataset results/dataset_im.py --models P910 --output-dir ./plots/sureal/images --plot-raw-data --plot-dis-videos --plot-observers
mkdir -p plots/sureal/videos
sureal --dataset results/dataset_vid.py --models P910 --output-dir ./plots/sureal/videos --plot-raw-data --plot-dis-videos --plot-observers
mkdir -p plots/sureal/full
sureal --dataset results/dataset_full.py --models P910 --output-dir ./plots/sureal/full --plot-raw-data --plot-dis-videos --plot-observers

exit 0
