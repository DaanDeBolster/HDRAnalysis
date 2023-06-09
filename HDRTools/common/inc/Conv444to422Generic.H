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
 * \file Conv444to422Generic.H
 *
 * \brief
 *    Conv444to422Generic class Header
 *
 * \author
 *     - Alexis Michael Tourapis         <atourapis@apple.com>
 *
 *************************************************************************************
 */


#ifndef __Conv444to422Generic_H__
#define __Conv444to422Generic_H__

#include "Global.H"
#include "Frame.H"
#include "ConvertColorFormat.H"
#include "ScaleFilter.H"

namespace hdrtoolslib {

class Conv444to422Generic : public ConvertColorFormat {

private:
  int     m_useMinMax;
  ScaleFilter *m_horFilter;
  ScaleFilter *m_horFilterM;

  
  void  filter(float  *out, const float  *inp, int width, int height, float minValue, float maxValue);
  void  filter(uint16 *out, const uint16 *inp, int width, int height, int   minValue, int   maxValue);
  void  filter(imgpel *out, const imgpel *inp, int width, int height, int   minValue, int   maxValue);

  float filterHorizontalMinMax  (const float  *inp, const ScaleFilter *filter, int pos_x, int width, float minValue, float maxValue);
  float filterHorizontalMinMax2 (const float  *inp, const ScaleFilter *filter, int pos_x, int width, float minValue, float maxValue);
  float filterHorizontalMinMax3 (const float  *inp, const ScaleFilter *filter, int pos_x, int width, float minValue, float maxValue);
  float filterHorizontal        (const float  *inp, const ScaleFilter *filter, int pos_x, int width, float minValue, float maxValue);
  int   filterHorizontal        (const uint16 *inp, const ScaleFilter *filter, int pos_x, int width, int   minValue, int   maxValue);
  int   filterHorizontal        (const int32  *inp, const ScaleFilter *filter, int pos_x, int width, int   minValue, int   maxValue);
  int   filterHorizontal        (const imgpel *inp, const ScaleFilter *filter, int pos_x, int width, int   minValue, int   maxValue);
public:
  // Construct/Deconstruct
  Conv444to422Generic(int width, int height, int method, ChromaLocation chromaLocationType[2], int useMinMax = 0);
  virtual ~Conv444to422Generic();
  
  virtual void process(Frame *out,  const Frame *inp);
};
} // namespace hdrtoolslib

#endif
