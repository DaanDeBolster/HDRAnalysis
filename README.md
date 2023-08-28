# HDR Analysis

This repository is meant as support for the masters dissertation with the follwowing title. <br />
> **Visual quality analysis of compressed high dynamic range video** <br />
> Daan De Bolster, Ghent University, august 2023

For further information on the context in which this code is written, refer to the corresponding thesis paper.


## Prerequisites

The [HDRTools](https://gitlab.com/standards/HDRTools) project is used to convert and measure HDR videos. This package is already added along the analysis code, including the Sim2 encoding functionality.

The [ffmpeg](https://ffmpeg.org/download.html) tool is used extensively to perform video conversions.

In addition, the [ffmpeg-quality-metrics](https://pypi.org/project/ffmpeg-quality-metrics/) command line tool is used to calculate the VIF and VMAF of each compressed sample.

[Siti-tools](https://pypi.org/project/siti-tools/) is used as a command line tool to generate the SI and TI values for the given sequences. The SI and TI of the used sequenes in this thesis have already been added in the `results/SiTi` directory.

For a correct functioning of the included Python scripts, the following modules need to be installed:
* [Numpy](https://numpy.org/)
* [Scipy](https://scipy.org/install/)
* [Pandas](https://pandas.pydata.org/)
* [OpenCV](https://pypi.org/project/opencv-python/)
* [Matplotlib](https://matplotlib.org/)

The prepared test sequences can be downloaded [here](https://drive.google.com/drive/folders/1aYDkE5pV0tcklP7M61uJr7NMheQkJiJH?usp=sharing). For a correct usage, they should be put in the `in` directory.


## Usage

### Pre-analysis
Running the `pre_analysis.py` script generates plots and measurements regarding the characteristics of the test sequences in the `in` directory, given the SI and TI data in the `results/SiTi/` directory. 
```
python3 pre_analysis.py
```

### Sim2 encoding
The Sim2 encoding algorith is implemented and added to the HDRTools code in the following files:
* `HDRTools/common/inc/Sim2Coding.H`
* `HDRTools/common/src/Sim2Coding.cpp`

Sim2 encoding can be applied by running HDRConvert as shown below.
```
./HDRTools/build/bin/HDRConvert
```

The Sim2 encoding functionality is disabled by default. It can be enabled by setting the `SetSim2` parameter to 1. Refer to the [HDRTools wiki](https://gitlab.com/standards/HDRTools/-/wikis/HDRConvert) for further information.


### Encoding a sequence
The `encode_frames.sh` shell script applies HEVC compression to a video sequence given a CRF and encodes the result into a set of tonemapped and Sim2 encoded frames. The CRF can be 0 to 51, or `none` to specify lossless compression. The script can be run as follows.
```
bash encode_frames.sh <name_to_label_output> <path_to_input_sequence> <CRF>
```

### Difference images
The `diff_frames.py` Python script generates difference images for a given set of frames. The script can be run as follows.
```
python3 diff_frames.py <number_of_frames_to_compare> <path_to_1th_input_frames> <path_to_2nd_input_frames> <path_to_output_frames>

```

### Generating plots
The `interpret_results.py` Python script generates plots and objective measurements using the opinion scores from the subjective tests.
```
python3 interpret_results.py
```

### Full analysis generation
The `test.py` shell script generates the full set of information used in this research. Note that this requires about half a Terabyte of storage.
```
bash test.sh
```