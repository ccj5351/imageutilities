#include "copy.h"


namespace iuprivate {

/* ***************************************************************************
 *  Declaration of CUDA WRAPPERS
 * ***************************************************************************/
extern void cuCopy(const iu::ImageGpu_32f_C1* src, iu::LinearDeviceMemory_32f_C1 *dst);

/* ***************************************************************************/


/* ***************************************************************************
 *  FUNCTION IMPLEMENTATIONS
 * ***************************************************************************/

//-----------------------------------------------------------------------------
void copy(const iu::ImageGpu_32f_C1 *src, iu::LinearDeviceMemory_32f_C1 *dst)
{
    IU_SIZE_CHECK(src, dst);
    cuCopy(src, dst);
}


} // namespace iuprivate
