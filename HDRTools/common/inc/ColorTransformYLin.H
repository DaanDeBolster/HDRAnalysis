/* The copyright in this software is being made available under the BSD
 * License, included below. This software may be subject to other third party
 * and contributor rights, including patent rights, and no such rights are
 * granted under this license.
 *
 * <OWNER> = ITU/ISO
 * <ORGANIZATION> = Netflix Inc, Ericsson, Apple Inc
 * <YEAR> = 2015
 *
 * Copyright (c) 2015, Netflix Inc, Ericsson, Apple Inc
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
 * \file ColorTransformYLin.H
 *
 * \class 
 *    ColorTransformYLin
 *
 * \brief
 *    Closed-form luma adjustment method using Taylor Series approximation 
 *    for minimizing sum of squared errors in linear light R, G, and B components
 *
 * \date
 *    $Date: 10/26/2015
 *
 * \author
 *     - Andrey Norkin                   <anorkin@netflix.com>
 *     - Alexis Michael Tourapis         <atourapis@apple.com>
 *     - Jacob Strom                     <jacob.strom@ericsson.com>
 *     - Jonatan Samuelsson              <jonatan.samuelsson@ericsson.com>
 *
 *************************************************************************************
 */


#ifndef __ColorTransformYLin_H__
#define __ColorTransformYLin_H__

#include "Global.H"
#include "Frame.H"
#include "ColorTransform.H"
#include "ColorTransformGeneric.H"
#include "ConvertColorFormat.H"
#include "TransferFunction.H"
#include "Convert.H"

namespace hdrtoolslib {

class ColorTransformYLin : public ColorTransform {
private:
  
  const double       *m_transform0;
  const double       *m_transform1;
  const double       *m_transform2;
  const double       *m_invTransform0;
  const double       *m_invTransform1;
  const double       *m_invTransform2;

  std::vector<float>       m_floatData;
  float              *m_floatComp[4];
  int64               m_size;              // number of samples
  int                 m_compSize[4];       // number of samples in each color component
  int                 m_height[4];         // height of each color component
  int                 m_width[4];          // width of each color component
  bool                m_memoryAllocated;
  bool                m_tfDistance;
  bool                m_isICtCp;
  
  int                 m_mode;
  int                 m_invMode;

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
  int                 m_iLumaWeight;

  TransferFunction   *m_transferFunction;

  void                allocateMemory(Frame* out, const Frame *inp);
  

public:
  // Construct/Deconstruct
  ColorTransformYLin( ColorTransformParams *params );
                        
  virtual ~ColorTransformYLin();
  
  virtual void process(Frame *out,  const Frame *inp);
};
} // namespace hdrtoolslib

#endif
