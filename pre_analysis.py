import numpy as np
from pandas import read_csv
import matplotlib.pyplot as plt
from cv2 import imread

# Read SiTi files
si = np.zeros((9,240))
ti = np.zeros((9,240))
select = np.array([59,58,221,111,48,144,150,48,60])
for seq in range(1,9):
    infile = "results/SiTi/seq"+str(seq)+".csv"
    siti_table = read_csv(infile)
    si[seq-1,:] = np.array(siti_table['si'])
    ti[seq-1,:] = np.array(siti_table['ti'])
infile = "results/SiTi/training.csv"
siti_table_train = read_csv(infile)
si[8,:] = np.array(siti_table_train['si'])
ti[8,:] = np.array(siti_table_train['ti'])

# Generate line plots for SI and TI
for seq in range(8):
    # Test sequences
    plt.plot(np.linspace(0,10,240), si[seq],'b',linewidth=0.8)
    plt.plot(np.linspace(0,10,240), np.ones(240)*np.average(si[seq]),'b--',linewidth=0.8)
    plt.plot(np.linspace(1/240,10,239), ti[seq,1:],'r',linewidth=0.8)
    plt.plot(np.linspace(1/240,10,239), np.ones(239)*np.average(ti[seq,1:]),'r--',linewidth=0.8)
    plt.vlines(select[seq]/24,0,100,'k',linestyles='--',linewidth=0.8)
    plt.xlim((0,10))
    plt.ylim((0,100))
    plt.xlabel("time[s]")
    plt.ylabel("SI & TI")
    plt.title("Test sample "+str(seq+1))
    plt.grid(True,color='gainsboro')
    plt.savefig("plots/preanalysis/SiTi_seq"+str(seq+1)+".png")
    plt.clf()
# Training sequence
seq=8
plt.plot(np.linspace(0,10,240), si[seq],'b',linewidth=0.8)
plt.plot(np.linspace(0,10,240), np.ones(240)*np.average(si[seq]),'b--',linewidth=0.8)
plt.plot(np.linspace(1/240,10,239), ti[seq,1:],'r',linewidth=0.8)
plt.plot(np.linspace(1/240,10,239), np.ones(239)*np.average(ti[seq,1:]),'r--',linewidth=0.8)
plt.vlines(select[seq]/24,0,100,'k',linestyles='--',linewidth=0.8)
plt.xlim((0,10))
plt.ylim((0,100))
plt.xlabel("time[s]")
plt.ylabel("SI & TI")
plt.title("Training sample")
plt.grid(True,color='gainsboro')
plt.savefig("plots/preanalysis/SiTi_training.png")
plt.clf()

# Generate scatterplot for SI and TI
x = np.average(si[8])
y = np.average(ti[8,1:])
plt.plot(x, y, 'bx')
plt.text(x * (1 + 0.01), y * (1 + 0.01) , 'Training', fontsize=9)
for seq in range(8):
    x = np.average(si[seq])
    y = np.average(ti[seq,1:])
    plt.plot(x, y, 'bx')
    plt.text(x * (1 + 0.01), y * (1 + 0.01) , 'Seq '+str(seq+1), fontsize=9)
plt.xlim((0, 80))
plt.ylim((0, 25))
plt.xlabel('SI')
plt.ylabel('TI')
plt.grid()
plt.savefig("plots/preanalysis/SiTi_scatterplot.png")
plt.clf()

def invPQ(E):
    m1 = (2610.0        ) / (4096.0 * 4.0)
    m2 = (2523.0 * 128.0) / 4096.0
    c1 = (3424.0        ) / 4096.0
    c2 = (2413.0 *  32.0) / 4096.0
    c3 = (2392.0 *  32.0) / 4096.0
    E = E/(2**8)
    FD = np.maximum(np.power(E,1/m2)-c1,0)/(c2-c3*np.power(E,1/m2))
    FD = 10000*np.power(FD,(1/m1))
    return FD

# Calculate the average and peak luminance (results are hard coded below)
Lpeak = np.zeros(9)
Lsum = np.zeros(9)
Lpeak_select = np.zeros(9)
Lmean_select = np.zeros(9)
for seq in range(8):
    peak_frame = np.zeros(240)
    avg_frame = np.zeros(240)
    for f in range(240):
        frame = imread("out/seq"+str(seq+1)+"/CRF_none/frames_bt709/{:05d}.tif".format(f))
        R = frame[:,:,2]
        G = frame[:,:,1]
        B = frame[:,:,0]
        L = 0.2126*R + 0.7152*G + 0.0722*B

        Lmax = invPQ(np.max(L))
        peak_frame[f] = Lmax
        Lavg = np.mean(invPQ(L))
        avg_frame[f] = Lavg
        if Lmax > Lpeak[seq]:
            Lpeak[seq]=Lmax
        Lsum[seq]+=Lavg
        if f == select[seq]:
            Lpeak_select[seq] = Lmax
            Lmean_select[seq] = Lavg
    # Plot line plots for luminance
    plt.plot(np.linspace(0,10,240), peak_frame, 'b')
    plt.plot(np.linspace(0,10,240), avg_frame , 'r')
    plt.vlines(select[seq]/24,0,10000,'k',linestyles='--',linewidth=0.8)
    plt.grid()
    plt.title("Test sample "+str(seq+1))
    plt.xlim([0,10])
    plt.ylim([0,10000])
    plt.xlabel('time(s)')
    plt.ylabel('Luminance(Cd/m²)')
    plt.savefig("plots/preanalysis/LuminanceRange_seq"+str(seq+1)+".png")
    plt.clf()
seq=8
peak_frame = np.zeros(240)
avg_frame = np.zeros(240)
for f in range(240):
    frame = imread("out/training/CRF_none/frames_bt709/{:05d}.tif".format(f))
    R = frame[:,:,2]
    G = frame[:,:,1]
    B = frame[:,:,0]
    L = 0.2126*R + 0.7152*G + 0.0722*B
    Lmax = invPQ(np.max(L))
    peak_frame[f] = Lmax
    Lavg = np.mean(invPQ(L))
    avg_frame[f] = Lavg
    if Lmax > Lpeak[seq]:
        Lpeak[seq]=Lmax
    Lsum[seq]+=Lavg
    if f == select[seq]:
        Lpeak_select[seq] = Lmax
        Lmean_select[seq] = Lavg
plt.plot(np.linspace(0,10,240), peak_frame, 'b')
plt.plot(np.linspace(0,10,240), avg_frame , 'r')
plt.vlines(select[seq]/24,0,10000,'k',linestyles='--',linewidth=0.8)
plt.grid()
plt.title("Training sample")
plt.xlim([0,10])
plt.ylim([0,10000])
plt.xlabel('time(s)')
plt.ylabel('Luminance(Cd/m²)')
plt.savefig("plots/preanalysis/LuminanceRange_training.png")
plt.clf()

Lmean = Lsum/240
print(Lmean)
print(Lpeak)
print()
print(Lmean_select)
print(Lpeak_select)

# Hard code of mean and peak luminance values
'''
Lmean = [ 89.12959748, 242.30732268, 135.43466831, 109.32684196,  27.65033045, 64.05530135, 172.3649915,  17.383469  ]    
Lpeak = [1123.41529112, 9281.77184391, 2253.00631578, 4258.97195176, 3877.38513297, 1353.85670611, 9281.77184391, 7369.29580257] 
Lmean_select = [ 41.43194438, 132.92543334, 183.96350201,  35.60351698,   9.51145759, 56.90990287, 208.80384806,  15.68075488]
Lpeak_select = [ 233.53944762, 8664.0385206,  2185.57928752, 2305.96400073, 1109.43770371, 881.1019449,  9281.77184391, 4032.39959859]
'''

# Print scatterplot for luminance
plt.plot(x, y, 'bx')
plt.text(x * (1 + 0.01), y * (1 + 0.01) , 'Training', fontsize=9)
for seq in range(8):
    x = Lmean[seq]
    y = Lpeak[seq]
    plt.plot(x, y, 'bx')
    plt.text(x * (1 + 0.01), y * (1 + 0.01) , 'Seq '+str(seq+1), fontsize=9)
seq = 8
x = Lmean[seq]
y = Lpeak[seq]
plt.plot(x, y, 'bx')
plt.text(x * (1 + 0.01), y * (1 + 0.01) , 'Training', fontsize=9)
plt.xlim((0, 300))
plt.ylim((0, 10000))
plt.xlabel('Mean luminance(Cd/m²)')
plt.ylabel('Peak luminance(Cd/m²)')
plt.grid()
plt.title("Video sequences")
plt.savefig("plots/preanalysis/LuminanceRange_scatterplot_videos.png")
plt.clf()

for seq in range(8):
    x = Lmean_select[seq]
    y = Lpeak_select[seq]
    plt.plot(x, y, 'bx')
    plt.text(x * (1 + 0.01), y * (1 + 0.01) , 'Seq '+str(seq+1), fontsize=9)
seq = 8
x = Lmean_select[seq]
y = Lpeak_select[seq]
plt.plot(x, y, 'bx')
plt.text(x * (1 + 0.01), y * (1 + 0.01) , 'Training', fontsize=9)
plt.xlim((0, 300))
plt.ylim((0, 10000))
plt.xlabel('Mean luminance(Cd/m²)')
plt.ylabel('Peak luminance(Cd/m²)')
plt.grid()
plt.title("Still image sequences")
plt.savefig("plots/preanalysis/LuminanceRange_scatterplot_images.png")
plt.clf()