import pandas as pd
import numpy as np
scores_vid = np.array(pd.read_csv('results/opinion_scores_vid.csv'))[1:,1:]
# scores_im  = np.array(pd.read_csv('results/opinion_scores_im.csv'))[:,1:]

ref_videos = []
for i in range(8):
    ref_videos.append(
        {
        'content_id': i, 'content_name': 'seq'+str(i+1),
        'path': '../../../../../../Volumes/One_Touch/Masters_dissertation/Subjective/seq'+str(i+1)+'/CRF_none/wcg_full.mkv'
        }
    )
dis_videos = []
for i in range(40):
    dis_videos.append(
        {
        'content_id': np.floor(i/5), 'asset_id': i,
        'os': list(scores_vid[:,i][np.where(scores_vid[:,i] != 0)]),
        'path': '../../../../../../Volumes/One_Touch/Masters_dissertation/Subjective/seq'+str(int(np.floor(i/5)+1))+'/CRF_'+str((i%5)*5+15)+'/wcg_full.mkv'
        },
    )
ref_score = 5

"""
sureal --dataset sureal/dataset_vid.py --models P910 --output-dir ./sureal/out_vid --plot-raw-data --plot-dis-videos --plot-observers
"""