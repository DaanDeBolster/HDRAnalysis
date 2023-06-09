/* The copyright in this software is being made available under the BSD
 * License, included below. This software may be subject to other third party
 * and contributor rights, including patent rights, and no such rights are
 * granted under this license.
 *
 * <OWNER> = Apple Inc.
 * <ORGANIZATION> = Apple Inc.
 * <YEAR> = 2016
 *
 * Copyright (c) 2016, Apple Inc.
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
 * \file ProjectParameters.H
 *
 * \brief
 *    ProjectParameters class (main) definition for GamutTest
 *
 * \author
 *     - Alexis Michael Tourapis         <atourapis@apple.com>
 *
 *************************************************************************************
 */

#ifndef __ProjectParameters_H__
#define __ProjectParameters_H__

#include "Global.H"
#include "Parameters.H"
#include "DistortionMetric.H"
#include "AnalyzeGamut.H"

#define DEFAULTCONFIGFILENAME "GamutTest.cfg"


class ProjectParameters : public hdrtoolslib::Parameters {
private:
public:
  ProjectParameters();
  /*input*/
  int                                 m_numberOfClips;
  hdrtoolslib::IOVideo                m_inputFile;
  hdrtoolslib::FrameFormat            m_source;
  hdrtoolslib::AnalyzeGamutParameters m_params;
  int                                 m_frameSkip;     //! Frame skipping for input
  double                              m_maxSampleValue;
  bool                                m_enableMetric[hdrtoolslib::DIST_METRICS];
  // Cropping parameters
  int                                 m_cropOffsetLeft  ;
  int                                 m_cropOffsetTop   ;
  int                                 m_cropOffsetRight ;
  int                                 m_cropOffsetBottom;

  char                                m_logFile[hdrtoolslib::MAX_LINE_LEN];

  hdrtoolslib::DistortionParameters   m_distortionParameters;
  
  virtual void update();
  virtual void refresh();
};

extern ProjectParameters ccParams;
  
#endif
