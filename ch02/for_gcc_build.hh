#include <cstdarg>
#include <cstdio>
#include <cstring>

void print(char *format, ...) {
  va_list args;
  va_start(args, format);
  vprintf(format, args);
  va_end(args);
  puts("");
}

int readint(char *prompt) {
  int i{0};
  printf(prompt);
  scanf("%d", &i);
  return i;
}

// keywords in c but not support in tinyc
#define auto
#define short
#define long
#define float
#define double
#define char
#define struct
#define union
#define enum
#define typedef
#define const
#define unsigned
#define signed
#define extern
#define register
#define static
#define volatile
#define switch
#define case
#define for
#define do
#define goto
#define default
#define sizeof