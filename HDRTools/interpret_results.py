import numpy as np
import pandas as pd
import os
import matplotlib.pyplot as plt
import scipy.stats as st
import scipy.special as sp
import scipy.interpolate as ip
import json
# from sklearn.linear_model import LogisticRegression
os.environ["OPENCV_IO_ENABLE_OPENEXR"]="1"

select = np.array([59,58,221,111,48,144,150,48, 60])
numpart = 22
numseq = 40
scores_vid = np.array(pd.read_csv('results/opinion_scores_vid.csv'), dtype=float)[:,1:]
scores_im = np.array(pd.read_csv('results/opinion_scores_im.csv'), dtype=float)[:,1:]
for i in range(np.shape(scores_vid)[0]):
    for j in range(np.shape(scores_vid)[1]):
        if scores_vid[i,j] == 0:
            scores_vid[i,j] = np.nan
        if scores_im[i,j] == 0:
            scores_im[i,j] = np.nan


MOS_table_vid = []
MOS_table_im  = []
full_MOS_vid = np.zeros(40)
full_MOS_im  = np.zeros(40)
full_PSNR_vid = np.zeros(40)
full_PSNR_im  = np.zeros(40)
full_SSIM_vid = np.zeros(40)
full_SSIM_im  = np.zeros(40)
full_VIF_vid = np.zeros(40)
full_VIF_im  = np.zeros(40)
full_VMAF_vid = np.zeros(40)
full_VMAF_im  = np.zeros(40)
full_HDRVQM = np.zeros(40)
for i in range(8):
    # Extract values
    x = np.array([15,20,25,30,35])

    amount_values_vid = np.sum(np.logical_not(np.isnan(scores_vid))*1,axis=0)
    MOS_vid = np.nanmean(scores_vid,axis=0)
    st_vid = np.nanstd(scores_vid,axis=0)
    ci_vid = st.norm.interval(0.95, loc=MOS_vid, scale=st_vid/np.sqrt(amount_values_vid))

    amount_values_im = np.sum(np.logical_not(np.isnan(scores_im))*1,axis=0)
    MOS_im = np.nanmean(scores_im,axis=0)
    st_im = np.nanstd(scores_im,axis=0)
    ci_im = st.norm.interval(0.95, loc=MOS_im, scale=st_im/np.sqrt(amount_values_im))

    fig, axs = plt.subplots(2, 3, figsize=(9, 6))
    psnr = np.zeros(5)
    ssim = np.zeros(5)
    psnr_im = np.zeros(5)
    ssim_im = np.zeros(5)
    hdrvqm = np.zeros(5)
    vmaf = np.zeros(5)
    vmaf_im = np.zeros(5)
    vif = np.zeros(5)
    vif_im = np.zeros(5)
    # with open('./Analysis/metrics.json', 'r') as f:
    #     ffmpeg_metrics = json.load(f)
    # vmaf = ffmpeg_metrics['global']['vmaf']['vmaf']


    for crf in [15,20,25,30,35]:
        with open('IO/seq'+str(i+1)+'/CRF_'+str(crf)+'/_metrics.txt') as f:
            file = f.readlines()
            line = file[36+2+240]
            psnr[int(crf/5-3)] = float(line.split()[4])
            ssim[int(crf/5-3)] = (float(line.split()[5])+float(line.split()[6])+float(line.split()[7]))/3
            imline = file[36+select[i]]
            psnr_im[int(crf/5-3)] = float(imline.split()[4])
            ssim_im[int(crf/5-3)] = (float(imline.split()[5])+float(imline.split()[6])+float(imline.split()[7]))/3
        with open('IO/seq'+str(i+1)+'/CRF_'+str(crf)+'/_HDRmetrics.txt') as f:
            file = f.readlines()
            line = file[37+2+240]
            hdrvqm[int(crf/5-3)] = (float(line.split()[1])+float(line.split()[2])+float(line.split()[3]))/3
        with open('IO/seq'+str(i+1)+'/CRF_'+str(crf)+'/_vif.json', 'r') as f:
            file = json.load(f)
            vif[int(crf/5-3)] =  file['global']['vif']['scale_1']['average']
            vif_im[int(crf/5-3)] = file['vif'][select[i]]['scale_1']
        with open('IO/seq'+str(i+1)+'/CRF_'+str(crf)+'/_vmaf.json', 'r') as f:
            file = json.load(f)
            vmaf[int(crf/5-3)] = file['global']['vmaf']['vmaf']['average']
            vmaf_im[int(crf/5-3)] = file['vmaf'][select[i]]['vmaf']
    
    # Plot line plots
    axs[0,0].plot(x, MOS_vid[i*5:(i+1)*5], label='MOS vid', color='blue')
    axs[0,0].fill_between(x, ci_vid[0][i*5:(i+1)*5], ci_vid[1][i*5:(i+1)*5], color='blue', alpha=.1)
    axs[0,0].plot(x, MOS_im[i*5:(i+1)*5], label='MOS im', color='red')
    axs[0,0].fill_between(x, ci_im[0][i*5:(i+1)*5], ci_im[1][i*5:(i+1)*5], color='red', alpha=.1)
    axs[0,0].grid()
    axs[0,0].set_xticks(np.array([15,20,25,30,35]))
    axs[0,0].set_yticks(np.array([0,1,2,3,4,5]))
    axs[0,0].set_ylim(np.array([0,5.1]))
    axs[0,0].set_xlabel('CRF')
    axs[0,0].set_title('MOS',fontsize=9)
    
    axs[0,1].plot(x, psnr, label='MOS vid', color='blue')
    axs[0,1].plot(x, psnr_im, label='MOS vid', color='red')
    axs[0,1].grid()
    axs[0,1].set_xticks(np.array([15,20,25,30,35]))
    axs[0,1].set_yticks(np.linspace(0,80,9))
    axs[0,1].set_ylim(np.array([0,81]))
    axs[0,1].set_xlabel('CRF')
    axs[0,1].set_title('PSNR(dB)',fontsize=9)

    axs[0,2].plot(x, ssim, label='MOS vid', color='blue')
    axs[0,2].plot(x, ssim_im, label='MOS vid', color='red')
    axs[0,2].grid()
    axs[0,2].set_xticks(np.array([15,20,25,30,35]))
    axs[0,2].set_yticks(np.linspace(0,1,11))
    axs[0,2].set_ylim(np.array([0,1.02]))
    axs[0,2].set_xlabel('CRF')
    axs[0,2].set_title('SSIM',fontsize=9)

    axs[1,0].plot(x, vif, label='MOS vid', color='blue')
    axs[1,0].plot(x, vif_im, label='MOS im', color='red')
    axs[1,0].grid()
    axs[1,0].set_xticks(np.array([15,20,25,30,35]))
    axs[1,0].set_yticks(np.linspace(0,1,11))
    axs[1,0].set_ylim(np.array([0,1.02]))
    axs[1,0].set_xlabel('CRF')
    axs[1,0].set_title('VIF',fontsize=9)

    axs[1,1].plot(x, vmaf, label='MOS vid', color='blue')
    axs[1,1].plot(x, vmaf_im, label='MOS im', color='red')
    axs[1,1].grid()
    axs[1,1].set_xticks(np.array([15,20,25,30,35]))
    axs[1,1].set_yticks(np.linspace(0,100,11))
    axs[1,1].set_ylim(np.array([0,102]))
    axs[1,1].set_xlabel('CRF')
    axs[1,1].set_title('VMAF',fontsize=9)

    axs[1,2].plot(x, hdrvqm, label='MOS vid', color='blue')
    axs[1,2].grid()
    axs[1,2].set_xticks(np.array([15,20,25,30,35]))
    axs[1,2].set_yticks(np.linspace(0,50,11))
    axs[1,2].set_ylim(np.array([0,51]))
    axs[1,2].set_xlabel('CRF')
    axs[1,2].set_title('HDR-VQM(dB)',fontsize=9)
    
    fig.suptitle('Sequence '+str(i+1), y=1)
    fig.tight_layout()
    fig.savefig('plots/results/seq'+str(i+1)+'.png', bbox_inches='tight')

    full_MOS_vid[i*5:(i+1)*5] = MOS_vid[i*5:(i+1)*5]
    full_MOS_im[i*5:(i+1)*5] = MOS_im[i*5:(i+1)*5]
    full_PSNR_vid[i*5:(i+1)*5] = psnr
    full_PSNR_im[i*5:(i+1)*5] = psnr_im
    full_SSIM_vid[i*5:(i+1)*5] = ssim
    full_SSIM_im[i*5:(i+1)*5] = ssim_im
    full_VIF_vid[i*5:(i+1)*5] = vif
    full_VIF_im[i*5:(i+1)*5] = vif_im
    full_VMAF_vid[i*5:(i+1)*5] = vmaf
    full_VMAF_im[i*5:(i+1)*5] = vmaf_im
    full_HDRVQM[i*5:(i+1)*5] = hdrvqm


    # Generate table for thesis
    for crf in [15,20,25,30,35]:
        MOS_table_vid.append([
            i+1,               # Condition (seq)
            crf,             # Condition (crf)
            amount_values_vid[int(5*i+crf/5-3)],        # Total votes
            np.nansum(scores_vid[:,int(5*i+crf/5-3)]==5),     # Number of occurences
            np.nansum(scores_vid[:,int(5*i+crf/5-3)]==4),
            np.nansum(scores_vid[:,int(5*i+crf/5-3)]==3),
            np.nansum(scores_vid[:,int(5*i+crf/5-3)]==2),
            np.nansum(scores_vid[:,int(5*i+crf/5-3)]==1),
            np.round(MOS_vid[int(5*i+crf/5-3)],2),                     # MOS
            np.round(st_vid[int(5*i+crf/5-3)],2),                      # Standard deviation
            np.round(ci_vid[0][int(5*i+crf/5-3)],2),                   # Confidence interval (left, 95%)
            np.round(ci_vid[1][int(5*i+crf/5-3)],2),                   # Confidence interval (right, 95%)
            np.round(np.nansum(scores_vid[:,int(5*i+crf/5-3)]>3)/amount_values_vid[int(5*i+crf/5-3)]*100,2),       # Percent >3
            np.round(np.nansum(scores_vid[:,int(5*i+crf/5-3)]<3)/amount_values_vid[int(5*i+crf/5-3)]*100,2),      # Percent <3
            np.round(psnr[int(crf/5-3)],2),
            np.round(ssim[int(crf/5-3)],2),
            np.round(vif[int(crf/5-3)],2),
            np.round(vmaf[int(crf/5-3)],2),
            np.round(hdrvqm[int(crf/5-3)],2)
        ])
        MOS_table_im.append([
            i+1,               # Condition (seq)
            crf,             # Condition (crf)
            amount_values_im[int(5*i+crf/5-3)],        # Total votes
            np.nansum(scores_im[:,int(5*i+crf/5-3)]==5),     # Number of occurences
            np.nansum(scores_im[:,int(5*i+crf/5-3)]==4),
            np.nansum(scores_im[:,int(5*i+crf/5-3)]==3),
            np.nansum(scores_im[:,int(5*i+crf/5-3)]==2),
            np.nansum(scores_im[:,int(5*i+crf/5-3)]==1),
            np.round(MOS_im[int(5*i+crf/5-3)],2),                     # MOS
            np.round(st_im[int(5*i+crf/5-3)],2),                      # Standard deviation
            np.round(ci_im[0][int(5*i+crf/5-3)],2),                   # Confidence interval (left, 95%)
            np.round(ci_im[1][int(5*i+crf/5-3)],2),                   # Confidence interval (right, 95%)
            np.round(np.nansum(scores_im[:,int(5*i+crf/5-3)]>3)/amount_values_im[int(5*i+crf/5-3)]*100,2),       # Percent >3
            np.round(np.nansum(scores_im[:,int(5*i+crf/5-3)]<3)/amount_values_im[int(5*i+crf/5-3)]*100,2),      # Percent <3
            np.round(psnr_im[int(crf/5-3)],2),
            np.round(ssim_im[int(crf/5-3)],2),
            np.round(vif_im[int(crf/5-3)],2),
            np.round(vmaf_im[int(crf/5-3)],2)
        ])
for i in range(numseq):
    if i%5==0:
        print('\t\hline')
    print("\t", MOS_table_vid[i][0], "&", MOS_table_vid[i][1], "&", MOS_table_vid[i][2], "&", MOS_table_vid[i][3], "&", MOS_table_vid[i][4], "&", MOS_table_vid[i][5], "&", MOS_table_vid[i][6], "&", MOS_table_vid[i][7], "&", MOS_table_vid[i][8], "&", MOS_table_vid[i][9], "&", MOS_table_vid[i][10], "&", MOS_table_vid[i][11], "&", MOS_table_vid[i][12], "&", MOS_table_vid[i][13], "&", MOS_table_vid[i][14], "&", MOS_table_vid[i][15], "&", MOS_table_vid[i][16], "&", MOS_table_vid[i][17], "&", MOS_table_vid[i][18], "\\\\")
print()
print("------------------------------------------------------------------------------------------")
print()
for i in range(40):
    if i%5==0:
        print('\t\hline')
    print("\t", MOS_table_im[i][0], "&", MOS_table_im[i][1], "&", MOS_table_im[i][2], "&", MOS_table_im[i][3], "&", MOS_table_im[i][4], "&", MOS_table_im[i][5], "&", MOS_table_im[i][6], "&", MOS_table_im[i][7], "&", MOS_table_im[i][8], "&", MOS_table_im[i][9], "&", MOS_table_im[i][10], "&", MOS_table_im[i][11], "&", MOS_table_im[i][12], "&", MOS_table_im[i][13], "&", MOS_table_im[i][14], "&", MOS_table_im[i][15], "&", MOS_table_im[i][16], "&", MOS_table_im[i][17], "\\\\")
print()
print("------------------------------------------------------------------------------------------")
print()


# Correlation analysis MOS
full_PSNR_vid = 4*sp.expit((full_PSNR_vid - np.mean(full_PSNR_vid))/np.std(full_PSNR_vid))+1
full_PSNR_im  = 4*sp.expit((full_PSNR_im  - np.mean(full_PSNR_im ))/np.std(full_PSNR_im ))+1
full_SSIM_vid = 4*sp.expit((full_SSIM_vid - np.mean(full_SSIM_vid))/np.std(full_SSIM_vid))+1
full_SSIM_im  = 4*sp.expit((full_SSIM_im  - np.mean(full_SSIM_im ))/np.std(full_SSIM_im ))+1
full_VIF_vid = 4*sp.expit((full_VIF_vid - np.mean(full_VIF_vid))/np.std(full_VIF_vid))+1
full_VIF_im  = 4*sp.expit((full_VIF_im  - np.mean(full_VIF_im ))/np.std(full_VIF_im ))+1
full_VMAF_vid = 4*sp.expit((full_VMAF_vid - np.mean(full_VMAF_vid))/np.std(full_VMAF_vid))+1
full_VMAF_im  = 4*sp.expit((full_VMAF_im  - np.mean(full_VMAF_im ))/np.std(full_VMAF_im ))+1
full_HDRVQM   = 4*sp.expit((full_HDRVQM   - np.mean(full_HDRVQM  ))/np.std(full_HDRVQM  ))+1

fig, axs = plt.subplots(1, 3, figsize=(9, 3))
xi = np.linspace(1,5,9)

axs[0].scatter(full_MOS_vid,full_PSNR_vid, color='blue', s=3)
axs[0].scatter(full_MOS_im,full_PSNR_im, color='red', s=3)
ip_vid = ip.interp1d(full_MOS_vid, full_PSNR_vid, bounds_error=False)
ip_im  = ip.interp1d(full_MOS_im , full_PSNR_im , bounds_error=False)
axs[0].plot(xi, ip_vid(xi), color='blue', alpha=0.5)
axs[0].plot(xi, ip_im(xi),  color='red' , alpha=0.5)
axs[0].set_xlim((1,5))
axs[0].set_ylim((1,5))
axs[0].set_xticks([1,2,3,4,5])
axs[0].set_yticks([1,2,3,4,5])
axs[0].set_xlabel("MOS")
axs[0].set_title("PSNR")
axs[0].grid()

axs[1].scatter(full_MOS_vid, full_SSIM_vid, color='blue', s=3)
axs[1].scatter(full_MOS_im, full_SSIM_im, color='red', s=3)
ip_vid = ip.interp1d(full_MOS_vid, full_SSIM_vid, bounds_error=False)
ip_im  = ip.interp1d(full_MOS_im , full_SSIM_im , bounds_error=False)
axs[1].plot(xi, ip_vid(xi), color='blue', alpha=0.5)
axs[1].plot(xi, ip_im(xi),  color='red' , alpha=0.5)
axs[1].set_xlim((1,5))
axs[1].set_ylim((1,5))
axs[1].set_xticks([1,2,3,4,5])
axs[1].set_yticks([1,2,3,4,5])
axs[1].set_xlabel("MOS")
axs[1].set_title("SSIM")
axs[1].grid()

axs[2].scatter(full_MOS_vid, full_VIF_vid, color='blue', s=3)
axs[2].scatter(full_MOS_im, full_VIF_im, color='red', s=3)
ip_vid = ip.interp1d(full_MOS_vid, full_VIF_vid, bounds_error=False)
ip_im  = ip.interp1d(full_MOS_im , full_VIF_im , bounds_error=False)
axs[2].plot(xi, ip_vid(xi), color='blue', alpha=0.5)
axs[2].plot(xi, ip_im(xi),  color='red' , alpha=0.5)
axs[2].set_xlim((1,5))
axs[2].set_ylim((1,5))
axs[2].set_xticks([1,2,3,4,5])
axs[2].set_yticks([1,2,3,4,5])
axs[2].set_xlabel("MOS")
axs[2].set_title("VIF")
axs[2].grid()

fig.savefig('plots/corr/corrplot_1.png', bbox_inches='tight')
fig, axs = plt.subplots(1, 2, figsize=(6, 3))

axs[0].scatter(full_MOS_vid, full_VMAF_vid, color='blue', s=3)
axs[0].scatter(full_MOS_im, full_VMAF_im, color='red', s=3)
ip_vid = ip.interp1d(full_MOS_vid, full_VMAF_vid, bounds_error=False)
ip_im  = ip.interp1d(full_MOS_im , full_VMAF_im , bounds_error=False)
axs[0].plot(xi, ip_vid(xi), color='blue', alpha=0.5)
axs[0].plot(xi, ip_im(xi),  color='red' , alpha=0.5)
axs[0].set_xlim((1,5))
axs[0].set_ylim((1,5))
axs[0].set_xticks([1,2,3,4,5])
axs[0].set_yticks([1,2,3,4,5])
axs[0].set_xlabel("MOS")
axs[0].set_title("VMAF")
axs[0].grid()

axs[1].scatter(full_MOS_vid,full_HDRVQM, color='blue', s=3)
ip_vid = ip.interp1d(full_MOS_vid, full_HDRVQM, bounds_error=False, kind='linear')
axs[1].plot(xi, ip_vid(xi), color='blue', alpha=0.5)
axs[1].set_xlim((1,5))
axs[1].set_ylim((1,5))
axs[1].set_xticks([1,2,3,4,5])
axs[1].set_yticks([1,2,3,4,5])
axs[1].set_xlabel("MOS")
axs[1].set_title("HDR-VQM")
axs[1].grid()

print(st.pearsonr(full_MOS_vid, full_PSNR_vid)[0], st.pearsonr(full_MOS_im, full_PSNR_im)[0])
print(st.pearsonr(full_MOS_vid, full_SSIM_vid)[0], st.pearsonr(full_MOS_im, full_SSIM_im)[0])
print(st.pearsonr(full_MOS_vid, full_VIF_vid)[0] , st.pearsonr(full_MOS_im, full_VIF_im)[0])
print(st.pearsonr(full_MOS_vid, full_VMAF_vid)[0], st.pearsonr(full_MOS_im, full_VMAF_im)[0])
print(st.pearsonr(full_MOS_vid, full_HDRVQM)[0])

# fig.suptitle('Correlation scatter ', y=1)
fig.savefig('plots/corr/corrplot_2.png', bbox_inches='tight')


# Correlation analysis IQM
fig, axs = plt.subplots(1, 2, figsize=(6, 3))

axs[0].scatter(full_PSNR_vid,full_PSNR_im, color='blue', s=3)
ip_vid = ip.interp1d(full_PSNR_vid, full_PSNR_im, bounds_error=False)
axs[0].plot(xi, ip_vid(xi), color='blue', alpha=0.5)
axs[0].set_xlim((1,5))
axs[0].set_ylim((1,5))
axs[0].set_xticks([1,2,3,4,5])
axs[0].set_yticks([1,2,3,4,5])
axs[0].set_xlabel("Score video")
axs[0].set_ylabel("Score image")
axs[0].set_title("PSNR")
axs[0].grid()

axs[1].scatter(full_SSIM_vid,full_SSIM_im, color='blue', s=3)
ip_vid = ip.interp1d(full_PSNR_vid, full_PSNR_im, bounds_error=False)
axs[1].plot(xi, ip_vid(xi), color='blue', alpha=0.5)
axs[1].set_xlim((1,5))
axs[1].set_ylim((1,5))
axs[1].set_xticks([1,2,3,4,5])
axs[1].set_yticks([1,2,3,4,5])
axs[1].set_xlabel("Score video")
axs[1].set_ylabel("Score image")
axs[1].set_title("SSIM")
axs[1].grid()

fig.savefig('plots/corr/corrplotIQM_1.png', bbox_inches='tight')
fig, axs = plt.subplots(1, 2, figsize=(6, 3))

axs[0].scatter(full_VIF_vid,full_VIF_im, color='blue', s=3)
ip_vid = ip.interp1d(full_VIF_vid, full_VIF_im, bounds_error=False)
axs[0].plot(xi, ip_vid(xi), color='blue', alpha=0.5)
axs[0].set_xlim((1,5))
axs[0].set_ylim((1,5))
axs[0].set_xticks([1,2,3,4,5])
axs[0].set_yticks([1,2,3,4,5])
axs[0].set_xlabel("Score video")
axs[0].set_ylabel("Score image")
axs[0].set_title("VIF")
axs[0].grid()

axs[1].scatter(full_VMAF_vid,full_VMAF_im, color='blue', s=3)
ip_vid = ip.interp1d(full_VMAF_vid, full_VMAF_im, bounds_error=False)
axs[1].plot(xi, ip_vid(xi), color='blue', alpha=0.5)
axs[1].set_xlim((1,5))
axs[1].set_ylim((1,5))
axs[1].set_xticks([1,2,3,4,5])
axs[1].set_yticks([1,2,3,4,5])
axs[1].set_xlabel("Score video")
axs[1].set_ylabel("Score image")
axs[1].set_title("VMAF")
axs[1].grid()

fig.savefig('plots/corr/corrplotIQM_2.png', bbox_inches='tight')

