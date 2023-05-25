# HDR Analysis

This repository is meant as support for a masters dissertation: <br />
Visual quality analysis of compressed high dynamic range video <br />
By Daan De Bolster, Ghent University, may 2023

For further information on the context in which this code is written, refer to the corresponding thesis paper.


### Generating difference images
A python script is included to generate difference images of 2 sets of video frames. The following prerequisites are necessary to run the code. Python 3 is required to run the code. Next to that the `cv2` module needs to be installed up front. This can be done via the following command.

	pip3 install opencv-python

Multiple video frames can be processed. The input frames are given as `.tif` files enumerated as follows in 2 seperate directories: `bt709_00000.tif`, `bt709_00001.tif`, `bt709_00002.tif`,... The script can be run using the following command.


    python3 diff_frames.py <frames> <input1> <input2> <output>


Here `<frames>` is the number of frames to be compared. `<input1>` and `<input2>` specify the paths to the directories where the input frames are stored and `<output>` is the path to the directory where the difference frames should be outputted.


###Converting frames to the Sim2 format

Sim2 encoding is added to the HDRTools package. The code can be found in `HDRTools/common/inc/Sim2Coding.H` and `HDRTools/common/src/Sim2Coding.cpp`. Sim2 encoding is disabled by default, it can be enabled by running `./HDRTools/build/bin/HDRConvert` and adding the option `-p SetSim2=1`. Note that Sim2 encoding is only supported for `.tif` inputs and outputs. However, HDRTools allows for multiple frames to be encoded at once.

###Reconstructing the full analysis

The full analysis pipeline is implemented as a Bash script in `encode.sh`. For being able to do run the full analysis script. The ffmpeg framework must be downloaded via this link: [https://ffmpeg.org/download.html](https://ffmpeg.org/download.html). The script can be run using the following command.

    bash encode.sh <CRF> <processing options> <compression options>

`<CRF>` is the constant rate factor for libx265 encoding. `none` is also a valid option to specify lossless compression. `<processing options>` is used to specify extra ffmpeg options and `<compression options>` is used to specify extra libx265 encoding options. Both can also be set to `none` if no extra options should be added.

The script also carries out an objective analysis and calculates a set of difference frames with an uncompressed reference video. These calculations can be disabled in the script code. Make sure that the prerequisites mentioned earlier are satisfied when generating difference frames is enabled.

Input videos should be in the HDR10 format and their paths must be specified in the `encode.sh` script.

If changes are made to the code, first cmake must be configured.

	cd HDRTools/build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	cd ../..

Afterwards a new build can be generated using make.

	cd HDRTools/build
	make
	cd ../..