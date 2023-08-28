# Python program to calculate the difference between the frames in a video.

# Make sure the following module is installed before running the code:
#     pip3 install opencv-python

# Run using python3
#     python3 diff_frames.py <number_of_frames_to_compare> <path_to_1th_input_frames> <path_to_2nd_input_frames> <path_to_output_frames>

import cv2
from sys import argv

scale_factor = 10
amount_frames = int(argv[1])
inpath1 = argv[2]
inpath2 = argv[3]
outpath = argv[4]

for f in range(amount_frames):
    infile1 = inpath1+'/frames_bt709/{0:0>5}'.format(f)+'.tif'
    infile2 = inpath2+'/frames_bt709/{0:0>5}'.format(f)+'.tif'
    image1_BGR = cv2.imread(infile1)
    image2_BGR = cv2.imread(infile2)
    imageDiff_BGR = cv2.subtract(image1_BGR,image2_BGR)
    # imageDiff_B = imageDiff_BGR.copy()
    # imageDiff_G = imageDiff_BGR.copy()
    # imageDiff_R = imageDiff_BGR.copy()
    # imageDiff_B[:,:,1],imageDiff_B[:,:,2] = 0,0
    # imageDiff_G[:,:,0],imageDiff_G[:,:,2] = 0,0
    # imageDiff_R[:,:,0],imageDiff_R[:,:,1] = 0,0
    cv2.imwrite(outpath+'/{0:0>5}.png'.format(f), scale_factor*imageDiff_BGR)
    # cv2.imwrite(outpath+'/B_{0:0>5}.png'.format(f), scale_factor*imageDiff_B)
    # cv2.imwrite(outpath+'/G_{0:0>5}.png'.format(f), scale_factor*imageDiff_G)
    # cv2.imwrite(outpath+'/R_{0:0>5}.png'.format(f), scale_factor*imageDiff_R)