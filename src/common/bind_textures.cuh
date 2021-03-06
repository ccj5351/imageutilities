
#pragma once
#include <cuda_runtime.h>
#include "iudefs.h"


namespace iu {
#ifdef __CUDACC__ // only include this in cuda files (seen by nvcc)

static const cudaChannelFormatDesc chd_float  = cudaCreateChannelDesc<float>();
static const cudaChannelFormatDesc chd_float2 = cudaCreateChannelDesc<float2>();
static const cudaChannelFormatDesc chd_float4 = cudaCreateChannelDesc<float4>();
static const cudaChannelFormatDesc chd_uchar4 = cudaCreateChannelDesc<uchar4>();

//---------------------------------------------------------------------------
// 2D
template<typename DataType>
inline void unbindTexture(texture<DataType, cudaTextureType2D>& tex)
{
  cudaUnbindTexture(tex);
}

//---------------------------------------------------------------------------
// 2D; 32f_C1
inline void bindTexture(texture<float, cudaTextureType2D>& tex, const iu::ImageGpu_32f_C1* mem,
                        cudaTextureFilterMode filter_mode=cudaFilterModeLinear)
{
  tex.addressMode[0] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.addressMode[1] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.filterMode = filter_mode;
  tex.normalized = false;
   cudaBindTexture2D(0, tex, mem->data(), chd_float,
                                    mem->width(), mem->height(), mem->pitch());
}

//---------------------------------------------------------------------------
// 2D; 32f_C2
inline void bindTexture(texture<float2, cudaTextureType2D>& tex, const iu::ImageGpu_32f_C2* mem,
                        cudaTextureFilterMode filter_mode=cudaFilterModeLinear)
{
  tex.addressMode[0] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.addressMode[1] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.filterMode = filter_mode;
  tex.normalized = false;
   cudaBindTexture2D(0, tex, mem->data(), chd_float2,
                                    mem->width(), mem->height(), mem->pitch());
}

//---------------------------------------------------------------------------
// 2D; 32f_C4
inline void bindTexture(texture<float4, cudaTextureType2D>& tex, const iu::ImageGpu_32f_C4* mem,
                        cudaTextureFilterMode filter_mode=cudaFilterModeLinear)
{
  tex.addressMode[0] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.addressMode[1] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.filterMode = filter_mode;
  tex.normalized = false;
   cudaBindTexture2D(0, tex, mem->data(), chd_float4,
                                    mem->width(), mem->height(), mem->pitch());
}

//---------------------------------------------------------------------------
// 2D; 8U_C4
inline void bindTexture(texture<uchar4, cudaTextureType2D>& tex, const iu::ImageGpu_8u_C4* mem,
                        cudaTextureFilterMode filter_mode=cudaFilterModeLinear)
{
  tex.addressMode[0] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.addressMode[1] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.filterMode = filter_mode;
  tex.normalized = false;
   cudaBindTexture2D(0, tex, mem->data(), chd_uchar4,
                                    mem->width(), mem->height(), mem->pitch());
}

//---------------------------------------------------------------------------
// 3D-slice; 32f_C1
inline void bindTexture(texture<float, cudaTextureType2D>& tex, const iu::VolumeGpu_32f_C1* mem, int slice,
                        cudaTextureFilterMode filter_mode=cudaFilterModeLinear)
{
  tex.addressMode[0] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.addressMode[1] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.filterMode = filter_mode;
  tex.normalized = false;
   cudaBindTexture2D(0, tex, mem->data(0,0,slice), chd_float,
                                    mem->width(), mem->height(), mem->pitch());
}

//---------------------------------------------------------------------------
// 3D-slice; 32f_C2
inline void bindTexture(texture<float2, cudaTextureType2D>& tex, const iu::VolumeGpu_32f_C2* mem, int slice,
                        cudaTextureFilterMode filter_mode=cudaFilterModeLinear)
{
  tex.addressMode[0] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.addressMode[1] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.filterMode = filter_mode;
  tex.normalized = false;
   cudaBindTexture2D(0, tex, mem->data(0,0,slice), chd_float2,
                                    mem->width(), mem->height(), mem->pitch());
}

//---------------------------------------------------------------------------
// 3D-slice; 32f_C4
inline void bindTexture(texture<float4, cudaTextureType2D>& tex, const iu::VolumeGpu_32f_C4* mem, int slice,
                        cudaTextureFilterMode filter_mode=cudaFilterModeLinear)
{
  tex.addressMode[0] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.addressMode[1] = cudaAddressModeClamp; // Neumann Boundary Conditions
  tex.filterMode = filter_mode;
  tex.normalized = false;
   cudaBindTexture2D(0, tex, mem->data(0,0,slice), chd_float4,
                                    mem->width(), mem->height(), mem->pitch());
}


#endif // __CUDACC__
} // namespace iu


