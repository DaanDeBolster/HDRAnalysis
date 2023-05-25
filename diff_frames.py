# Python program to calculate the difference between the frames in a video.
# The frames are given in 2 directories as .tif files enumerated as follows: 'bt709_00000.tif', 'bt709_00001.tif', 'bt709_00002.tif',...  

# Make sure the following module is installed before running the code:
#     pip3 install opencv-python

# Run using python3
#     python3 diff_frames.py <number of frames to compare> <path to 1th input frames directory> <path to 2th input frames directory> <path to the output frames directory>

import cv2
import os
import sys
os.environ["OPENCV_IO_ENABLE_OPENEXR"]="1"

scale_factor = 10
amount_frames = int(sys.argv[1])
inpath1 = sys.argv[2]
inpath2 = sys.argv[3]
outpath = sys.argv[4]

for f in range(amount_frames):
    infile1 = inpath1+'bt709_{0:0>5}'.format(f)+'.tif'
    infile2 = inpath2+'bt709_{0:0>5}'.format(f)+'.tif'
    image1_BGR = cv2.imread(infile1)
    image2_BGR = cv2.imread(infile2)
    imageDiff_BGR = cv2.subtract(image1_BGR,image2_BGR)
    imageDiff_B = imageDiff_BGR.copy()
    imageDiff_G = imageDiff_BGR.copy()
    imageDiff_R = imageDiff_BGR.copy()
    imageDiff_B[:,:,1],imageDiff_B[:,:,2] = 0,0
    imageDiff_G[:,:,0],imageDiff_G[:,:,2] = 0,0
    imageDiff_R[:,:,0],imageDiff_R[:,:,1] = 0,0

    cv2.imwrite(outpath+ '{0:0>5}'.format(f)+'.tif',scale_factor*imageDiff_BGR, params=(int(cv2.IMWRITE_TIFF_COMPRESSION), 1))
    # cv2.imwrite(outpath+'B{0:0>5}'.format(f)+'.tif',scale_factor*imageDiff_B,   params=(int(cv2.IMWRITE_TIFF_COMPRESSION), 1))
    # cv2.imwrite(outpath+'G{0:0>5}'.format(f)+'.tif',scale_factor*imageDiff_G,   params=(int(cv2.IMWRITE_TIFF_COMPRESSION), 1))
    # cv2.imwrite(outpath+'R{0:0>5}'.format(f)+'.tif',scale_factor*imageDiff_R,   params=(int(cv2.IMWRITE_TIFF_COMPRESSION), 1))