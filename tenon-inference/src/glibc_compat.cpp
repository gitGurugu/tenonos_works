// glibc compatibility layer for Unikraft/musl
// Provides stub implementations for glibc symbols used by MNN library

#include <cstdio>
#include <cstddef>
#include <cstdarg>
#include <cwchar>
#include <cstring>
#include <fcntl.h>

extern "C" {

// __libc_single_threaded is a glibc symbol used for thread-safety optimizations
// In Unikraft, we can assume single-threaded or provide a simple implementation
// This is a weak symbol that glibc provides
int __libc_single_threaded = 1;

// __printf_chk is glibc's checked printf variant
// It performs format string validation and stack overflow protection
// For Unikraft, we can just forward to regular printf
int __printf_chk(int flag, const char* format, ...) {
    va_list args;
    va_start(args, format);
    int ret = vprintf(format, args);
    va_end(args);
    return ret;
}

// __fprintf_chk - checked fprintf
int __fprintf_chk(FILE* stream, int flag, const char* format, ...) {
    va_list args;
    va_start(args, format);
    int ret = vfprintf(stream, format, args);
    va_end(args);
    return ret;
}

// __sprintf_chk - checked sprintf
int __sprintf_chk(char* str, int flag, size_t strlen, const char* format, ...) {
    va_list args;
    va_start(args, format);
    int ret = vsnprintf(str, strlen, format, args);
    va_end(args);
    return ret;
}

// __snprintf_chk - checked snprintf
int __snprintf_chk(char* str, size_t maxlen, int flag, size_t strlen, const char* format, ...) {
    va_list args;
    va_start(args, format);
    int ret = vsnprintf(str, maxlen < strlen ? maxlen : strlen, format, args);
    va_end(args);
    return ret;
}

// ===== 额外的 glibc fortify / locale / I/O 相关符号，用于满足 libstdc++ 和 MNN 依赖 =====

// __memcpy_chk: fortify 版本，内部直接调用 memcpy
void *__memcpy_chk(void *dest, const void *src, size_t n, size_t destlen)
{
    (void)destlen;
    return std::memcpy(dest, src, n);
}

// __mbsnrtowcs_chk: fortify 版本，内部直接调用 mbsnrtowcs
size_t __mbsnrtowcs_chk(wchar_t *dst, const char **src,
                        size_t nmc, size_t len,
                        mbstate_t *ps, size_t dstlen)
{
    // 简单起见，忽略 dstlen 的检查，直接转发给标准函数
    (void)dstlen;
    return mbsnrtowcs(dst, src, nmc, len, ps);
}

// __mbsrtowcs_chk: fortify 版本，内部直接调用 mbsrtowcs
size_t __mbsrtowcs_chk(wchar_t *dst, const char **src,
                       size_t len, mbstate_t *ps, size_t dstlen)
{
    (void)dstlen;
    return mbsrtowcs(dst, src, len, ps);
}

// __wmemcpy_chk: fortify 版本，内部直接调用 wmemcpy
wchar_t *__wmemcpy_chk(wchar_t *dest, const wchar_t *src,
                       size_t n, size_t destlen)
{
    // 同样忽略 destlen 检查，假定调用方保证缓冲区足够大
    (void)destlen;
    return wmemcpy(dest, src, n);
}

// __wmemmove_chk: fortify 版本，内部直接调用 wmemmove
wchar_t *__wmemmove_chk(wchar_t *dest, const wchar_t *src,
                        size_t n, size_t destlen)
{
    (void)destlen;
    return wmemmove(dest, src, n);
}

// __wmemset_chk: fortify 版本，内部直接调用 wmemset
wchar_t *__wmemset_chk(wchar_t *s, wchar_t c,
                       size_t n, size_t destlen)
{
    (void)destlen;
    return wmemset(s, c, n);
}

// __open_2: glibc 的 fortify open 版本
extern int open(const char *pathname, int flags, ...);

int __open_2(const char *pathname, int oflag)
{
    // 这里简单地直接转发给 open，不强制执行 O_NOFOLLOW 等额外检查
    return open(pathname, oflag);
}

// __dso_handle: C++ 静态析构/全局对象所需的句柄
// 在 glibc 中这是由 CRT 对象提供的，这里给出一个最小 stub
void *__dso_handle __attribute__((visibility("hidden")));

} // extern "C"
