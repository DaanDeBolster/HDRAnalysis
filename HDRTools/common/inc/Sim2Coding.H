#ifndef __Sim2Coding_H__
#define __Sim2Coding_H__

#include "Global.H"
#include "Parameters.H"
#include "Frame.H"

namespace hdrtoolslib {

class Sim2Coding {
    private:
    // process method parameters
    float alpha = 0.0376;
    int Lscale = 32;
    int peakPQ = pow(10,4);
    double RGB2020_XYZ[3][3] = {0.412137,0.376845,0.142235, 
                                0.221852,0.757303,0.081677,
                                0.011588,0.069829,0.706036};
    float im_u;
    float im_v;
    float im_l_h;
    float im_l_l;
    float C_hu;
    float C_lu;
    float C_hv;
    float C_lv;
    float val;
    float* im_u_unfiltered;
    float* im_v_unfiltered;
    float* im_l_h_unfiltered;
    float* im_l_l_unfiltered;
    int r_sim2;
    int g_sim2;
    int b_sim2;

    public:

    // Construct/Deconstruct
    Sim2Coding();
    ~Sim2Coding();

    void process(Frame *outFrame, Frame *inFrame);
    };

    }// namespace hdrtoolslib

#endif