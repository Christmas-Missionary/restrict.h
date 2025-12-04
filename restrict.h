/*
Copyright (c) 2025 Christmas_Missionary - BSD Zero Clause License
*/

#ifndef RESTRICT_CPP_CONVENIENCE_MACRO
#define RESTRICT_CPP_CONVENIENCE_MACRO

#ifdef NO_RESTRICT
#define restrict
#endif /* NO_RESTRICT */

#if defined(__cplusplus) || (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 199901L)

#if defined(__GNUC__) || defined(__clang__)
#define restrict __restrict__
#elif defined(_MSC_VER)
#define restrict __restrict
#else /* Not GCC, Clang, or MSVC */
#define restrict
#endif

#endif /* If C++ or before C99 */
#endif /* RESTRICT_CPP_CONVENIENCE_MACRO */
