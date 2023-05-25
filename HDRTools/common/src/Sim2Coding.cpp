//-----------------------------------------------------------------------------
// Include headers
//-----------------------------------------------------------------------------

#include "Global.H"
#include "Sim2Coding.H"

//-----------------------------------------------------------------------------
// Macros
//-----------------------------------------------------------------------------

namespace hdrtoolslib {

//-----------------------------------------------------------------------------
// Constructor/destructor
//-----------------------------------------------------------------------------

Sim2Coding::Sim2Coding() {};
Sim2Coding::~Sim2Coding() {};

//-----------------------------------------------------------------------------
// Private methods
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Public methods
//-----------------------------------------------------------------------------

void Sim2Coding::process(Frame *outFrame, Frame *inFrame) {
    if (!inFrame) {
        std::cout << "inFrame is NULL in Sim2Coding\n";
    } else {
        if (inFrame->m_isFloat != 1) std::cout << "To transfer to the Sim2 format, data must be in \"float\" type.\n";

        int h = inFrame->m_height[0];
        int w = inFrame->m_width[0];
        im_u_unfiltered = new float[h*w];
        im_v_unfiltered = new float[h*w];
        im_l_h_unfiltered = new float[h*w];
        im_l_l_unfiltered = new float[h*w];

        for (size_t x = 0; x < w; x++) {
        for (size_t y = 0; y < h; y++) {
            // Get sub-pixel values: RGB BT709
            float r = inFrame->m_floatComp[0][x+y*w];
            float g = inFrame->m_floatComp[1][x+y*w];
            float b = inFrame->m_floatComp[2][x+y*w];

            // Convert from RGB to XYZ
            float X = r*RGB2020_XYZ[0][0]+g*RGB2020_XYZ[0][1]+b*RGB2020_XYZ[0][2];
            float Y = r*RGB2020_XYZ[1][0]+g*RGB2020_XYZ[1][1]+b*RGB2020_XYZ[1][2];
            float Z = r*RGB2020_XYZ[2][0]+g*RGB2020_XYZ[2][1]+b*RGB2020_XYZ[2][2];
            
            // Convert from XYZ to logLu'v'
            float norm = X + 15*Y + 3*Z;
            im_u = ((1626.6875*X/norm)+0.546875)*4;
            im_v = (((3660.046875*Y)/norm)+0.546875)*4;
            float im_l = Y;

            if (im_l < 0.00001) im_l = 0.00001;
            if (im_l > 0) im_l = (alpha*log2(im_l))+0.5;
            im_l = (253 * im_l + 1) * Lscale;
            im_l = floor(im_l+0.5);
            if (im_l < 32) im_l = 32;
            if (im_l > 8159) im_l = 8159;
            im_l_h = floor(im_l/32.0);
            im_l_l = im_l-im_l_h*32.0;
            
            im_u_unfiltered[x+y*w] = im_u;
            im_v_unfiltered[x+y*w] = im_v;
            im_l_h_unfiltered[x+y*w] = im_l_h;
            im_l_l_unfiltered[x+y*w] = im_l_l;
        }}

        for (size_t x = 0; x < w; x++) {
        for (size_t y = 0; y < h; y++) {
            // Convolutional filter on u'v'
            if (x==0) {
                im_u = (im_u_unfiltered[x+y*w]+2*im_u_unfiltered[(x+1)+y*w])/3;
                im_v = (im_v_unfiltered[x+y*w]+2*im_v_unfiltered[(x+1)+y*w])/3;
            } else if (x>=w-1) {
                im_u = (2*im_u_unfiltered[(x-1)+y*w]+im_u_unfiltered[x+y*w])/3;
                im_v = (2*im_v_unfiltered[(x-1)+y*w]+im_v_unfiltered[x+y*w])/3;
            } else {
                im_u = (im_u_unfiltered[(x-1)+y*w]+im_u_unfiltered[x+y*w]+im_u_unfiltered[(x+1)+y*w])/3;
                im_v = (im_v_unfiltered[(x-1)+y*w]+im_v_unfiltered[x+y*w]+im_v_unfiltered[(x+1)+y*w])/3;
            }
            im_l_h = im_l_h_unfiltered[x+y*w];
            im_l_l = im_l_l_unfiltered[x+y*w];

            // Account for HDMI restrictions
            im_v = floor(im_v+0.5);
            im_u = floor(im_u+0.5);
            if (im_u<4) im_u = 4;
            if (im_v<4) im_v = 4;
            if (im_u>1019) im_u = 1019;
            if (im_v>1019) im_v = 1019;

            C_hu=floor(im_u/4); // 8 most significant bits
            C_lu=im_u-4*C_hu;   // 2 least significant bits
            C_hv=floor(im_v/4);
            C_lv=im_v-4*C_hv;

            // Odd column pixel packing
            if (x%2==0) {
                val = 8*im_l_l + 2*C_lv;
                if (val < 1) val = 1;
                if (val > 254) val = 254;
                r_sim2 = val;
                g_sim2 = im_l_h;
                b_sim2 = C_hv;
            // Even column pixel packing
            } else {
                r_sim2 = C_hu;
                g_sim2 = im_l_h;
                val = 8*im_l_l + 2*C_lu;
                if (val < 1) val = 1;
                if (val > 254) val = 254;
                b_sim2 = val;
            }
            
            // write to output sub-pixels
            outFrame->m_ui16Comp[0][x+y*w] = (int)r_sim2*pow(2,8);
            outFrame->m_ui16Comp[1][x+y*w] = (int)g_sim2*pow(2,8);
            outFrame->m_ui16Comp[2][x+y*w] = (int)b_sim2*pow(2,8);
        }}
    
    delete[] im_u_unfiltered;
    delete[] im_v_unfiltered;
    delete[] im_l_h_unfiltered;
    delete[] im_l_l_unfiltered;
    }
  };

} // namespace hdrtoolslib

//-----------------------------------------------------------------------------
// End of file
//-----------------------------------------------------------------------------