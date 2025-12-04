#include "../restrict.h"

void add(int size, int * restrict a, int * restrict b, const int * src) {
  for (; size >= 0; size--) {
    a[size] += src[size];
    b[size] += src[size];
  }
}
