/* The copyright in this software is being made available under the BSD
 * License, included below. This software may be subject to other third party
 * and contributor rights, including patent rights, and no such rights are
 * granted under this license.
 *
 * <OWNER> = ITU/ISO
 * <ORGANIZATION> = Ericsson, Apple Inc
 * <YEAR> = 2015
 *
 * Copyright (c) 2015, Ericsson, Apple Inc
 * All rights reserved.
 
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *  * Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *  * Neither the name of the <ORGANIZATION> nor the names of its contributors may
 *    be used to endorse or promote products derived from this software without
 *    specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 */

/*!
 *************************************************************************************
 * \file ColorTransformYAdjustFull.H
 *
 * \brief
 *    ColorTransformYAdjustFull Class Header
 *
 * \author
 *     - Jacob Strom                     <jacob.strom@ericsson.com>
 *     - Jonatan Samuelsson              <jonatan.samuelsson@ericsson.com>
 *     - Alexis Michael Tourapis         <atourapis@apple.com>
 *
 *************************************************************************************
 */


#ifndef __ColorTransformYAdjustFull_H__
#define __ColorTransformYAdjustFull_H__

#include "Global.H"
#include "Frame.H"
#include "ColorTransform.H"
#include "ColorTransformGeneric.H"
#include "ConvertColorFormat.H"
#include "TransferFunction.H"
#include "Convert.H"

namespace hdrtoolslib {

class ColorTransformYAdjustFull : public ColorTransform {
private:
  
  const double       *m_transform0;
  const double       *m_transform1;
  const double       *m_transform2;
  const double       *m_invTransform0;
  const double       *m_invTransform1;
  const double       *m_invTransform2;
  const double       *m_transformRGBtoY;  // Y in XYZ

  std::vector<float>       m_floatData;
  float              *m_floatComp[4];
  int64               m_size;              // number of samples
  int                 m_compSize[4];       // number of samples in each color component
  int                 m_height[4];         // height of each color component
  int                 m_width[4];          // width of each color component
  bool                m_memoryAllocated;
  bool                m_tfDistance;
  
  int                 m_mode;
  int                 m_invMode;
  int                 m_modeRGB2XYZ;
  bool                m_isICtCp;
  
  ConvertColorFormat *m_fwdColorFormat;
  ConvertColorFormat *m_invColorFormat;
    
  
  Convert            *m_fwdConvertProcess; 
  Convert            *m_invConvertProcess;
   
  Frame              *m_fwdFrameStore2; 
  Frame              *m_invFrameStore2; 
  Frame              *m_fwdFrameStore;
  Frame              *m_invFrameStore;
  double              m_lumaWeight;
  double              m_chromaWeight;
  double              m_lumaOffset;
  double              m_chromaOffset;
  TransferFunction   *m_transferFunction;

  void                allocateMemory(Frame* out, const Frame *inp);
  double              convertToYLinear(const double rComp, const double gComp, const double bComp);
  double              convertToY      (const double rComp, const double gComp, const double bComp);
  void                calcBoundsSloppy(int &ypBufLowPix, int &ypBufHighPix, double yLinear, double uComp, double vComp);
  void                calcBounds(int &ypBufLowPix, int &ypBufHighPix, double yLinear, double uComp, double vComp);
  void                convertToRGB(const double yComp, const double uComp, const double vComp, double *rComp, double *gComp, double *bComp);

public:
  // Construct/Deconstruct
  ColorTransformYAdjustFull( ColorTransformParams *params );
                        
  virtual ~ColorTransformYAdjustFull();
  
  virtual void process(Frame *out,  const Frame *inp);
  
};
} // namespace hdrtoolslib

#endif
