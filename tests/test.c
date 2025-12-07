#include "../restrict.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void add(int size, int * RESTRICT a, int * RESTRICT b, const int * src);

void add(int size, int * RESTRICT a, int * RESTRICT b, const int * src) {
  for (; size >= 0; size--) {
    a[size] += src[size];
    b[size] += src[size];
  }
}

#define SIZE 10

int main(void) {
  int index = 0;
  int buffer[SIZE * 3] = {0};

  /* Not recommended for quality seeding,
  but for C89 portability AND avoiding bcrypt + CMake, this will do. */
  srand((unsigned int)(time(NULL)));
  for (; index < SIZE * 3; index++) {
    buffer[index] = rand();
  }
  add(SIZE, buffer, buffer + SIZE, buffer + (SIZE * 2));

  for (index = 0; index < SIZE * 3; index++) {
    (void)printf("%d\n", buffer[index]);
  }
  return 0;
}
