// -*- C++ -*-
//===-------------------- support/android/wchar_support.c ------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is dual licensed under the MIT and the University of Illinois Open
// Source Licenses. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef _NL_TYPES_H
#define _NL_TYPES_H 1

#define NL_SETD 1
#define NL_CAT_LOCALE 1
#ifdef __cplusplus
extern "C" {
#endif

typedef void* nl_catd;
typedef int nl_item;
nl_catd  catopen(const char*, int);
char*    catgets(nl_catd, int, int, const char*);
int      catclose(nl_catd);

#ifdef __cplusplus
}  // extern "C"
#endif

#endif /* nl_types.h  */
