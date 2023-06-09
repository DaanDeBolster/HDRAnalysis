/* The copyright in this software is being made available under the BSD
 * License, included below. This software may be subject to other third party
 * and contributor rights, including patent rights, and no such rights are
 * granted under this license.
 *
 * <OWNER> = Apple Inc.
 * <ORGANIZATION> = Apple Inc.
 * <YEAR> = 2014
 *
 * Copyright (c) 2014, Apple Inc.
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
 * \file HDRConvScalerTIFF.H
 *
 * \brief
 *    HDRConvScalerTIFF class (main) definition for converting TIFF files
 *
 * \author
 *     - Alexis Michael Tourapis         <atourapis@apple.com>
 *
 *************************************************************************************
 */

#ifndef __HDRConvScalerTIFF_H__
#define __HDRConvScalerTIFF_H__

#include "Global.H"
#include "HDRConvScaler.H"
#include "Input.H"
#include "Output.H"
#include "Frame.H"
#include "IOFunctions.H"
#include "Convert.H"
#include "ConvertColorFormat.H"
#include "ColorTransform.H"
#include "TransferFunction.H"
#include "FrameFilter.H"
#include "AddNoise.H"
#include "FrameScale.H"

class HDRConvScalerTIFF : public HDRConvScaler {
private:
  bool                               m_useSingleTransferStep;
  int                                m_useMinMax;
  bool                               m_filterInFloat;
  int                                m_startFrame;
  int                                m_noOfFrameStores;

  hdrtoolslib::Input                *m_inputFrame;             // input frames
  hdrtoolslib::Output               *m_outputFrame;            // output frames
  hdrtoolslib::Frame                *m_oFrameStore;            // picture storage for output frames
  hdrtoolslib::Frame                *m_iFrameStore;            // picture storage for input frames
  hdrtoolslib::Frame                *m_dFrameStore;              // picture storage for linear downconversion
 
  hdrtoolslib::Frame                *m_pFrameStore[7];         // picture storage for processing frames
  hdrtoolslib::Frame                *m_pDFrameStore[7];          // picture storage for processing frames
  hdrtoolslib::Frame                *m_croppedFrameStore;      // cropped frame store
  
//  hdrtoolslib::Frame                *m_colorSpaceFrame;
  hdrtoolslib::Frame                *m_scaledFrame;
  
  hdrtoolslib::FrameFilter          *m_frameFilterNoise0;
  hdrtoolslib::FrameFilter          *m_frameFilterNoise1;
  
  hdrtoolslib::Convert              *m_convertProcess;         // Conversion process
  hdrtoolslib::Convert              *m_convertIQuantize;       // Inverse Quantize TIFF files
  
  hdrtoolslib::ColorTransform       *m_colorTransform;         // Color space conversion
  hdrtoolslib::ColorTransform       *m_colorSpaceConvert;      // Alter color space in linear space, if for example in XYZ or in different RGB space
  
  hdrtoolslib::ConvertColorFormat   *m_convertTo420;           // Chroma subsampling
  
  hdrtoolslib::AddNoise             *m_addNoise;                 // Noise Addition
  hdrtoolslib::FrameScale           *m_chromaScale;              // Frame downscale for linear chroma conversion
  
  hdrtoolslib::FrameScale           *m_frameScale;                // Downscaler for the full image (currently only supports 1/2 horizontal/vertical scaling)

  hdrtoolslib::TransferFunction     *m_normalizeFunction;      //! Data normalization for OpenEXR inputs with linear light data
  hdrtoolslib::TransferFunction     *m_outputTransferFunction; //! Inverse Transfer function
  hdrtoolslib::TransferFunction     *m_inputTransferFunction;  //! Forward Transfer function

  void                               allocateFrameStores (ProjectParameters *inputParams, hdrtoolslib::FrameFormat   *input, hdrtoolslib::FrameFormat   *output);
  void                               deleteMemory();
  
  // Cropping information
  int                                m_cropOffsetLeft;
  int                                m_cropOffsetTop;
  int                                m_cropOffsetRight;
  int                                m_cropOffsetBottom;
  bool                               m_bUseWienerFiltering;
  bool                               m_bUse2DSepFiltering;
  bool                               m_b2DSepMode;

  
public:
  HDRConvScalerTIFF                           (ProjectParameters *inputParams);
  
  virtual void         outputHeader        (ProjectParameters *inputParams);
  virtual void         outputFooter        (ProjectParameters *inputParams);
  virtual void         init                (ProjectParameters *inputParams);
  virtual void         process             (ProjectParameters *inputParams);
  virtual void         destroy             ();
  
};

#endif
