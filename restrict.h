/*
Copyright (c) 2025 Christmas_Missionary - BSD Zero Clause License
*/

#ifndef RESTRICT_CPP_CONVENIENCE_MACRO
#define RESTRICT_CPP_CONVENIENCE_MACRO

#ifdef NO_RESTRICT
#define RESTRICT
#elif defined(__cplusplus) || (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 199901L)

#if defined(__GNUC__) || defined(__clang__)
#define RESTRICT __restrict__
#elif defined(_MSC_VER)
#define RESTRICT __restrict
#else /* Not GCC, Clang, or MSVC */
#define RESTRICT
#endif

#else /* If not C++ and at least C99 */
#define RESTRICT restrict
#endif

#endif /* RESTRICT_CPP_CONVENIENCE_MACRO */
