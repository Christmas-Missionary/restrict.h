#!/usr/bin/env bash

mkdir asm
cp tests/test.c tests/test.cpp

opts="-Wall -Wextra -Wpedantic -O3"

if [[ "$(uname)" == "Darwin" ]]; then
  clang_str="cc"
  gcc_str="gfortran"
  other_gcc=""
else
  clang_str="clang"
  gcc_str="gcc"
  other_gcc="gfortran"
fi

which $clang_str
if (( $? == 0 )); then
  $clang_str $opts tests/test.c -S -o asm/clang_control.s -std=c99 -DNO_RESTRICT
  $clang_str $opts tests/test.c -S -o asm/clang_c89.s -std=c89
  $clang_str $opts tests/test.c -S -o asm/clang_c99.s -std=c99
  $clang_str $opts tests/test.cpp -S -o asm/clang_cpp98.s -std=c++98
fi

which $gcc_str
if (( $? == 0 )); then
  $gcc_str $opts tests/test.c -S -o asm/gcc_control.s -std=c99 -DNO_RESTRICT
  $gcc_str $opts tests/test.c -S -o asm/gcc_c89.s -std=c89
  $gcc_str $opts tests/test.c -S -o asm/gcc_c99.s -std=c99
  $gcc_str $opts tests/test.cpp -S -o asm/gcc_cpp98.s -std=c++98
elif [[ $other_gcc != "" && $(which $other_gcc) == 0 ]]; then
  $other_gcc $opts tests/test.c -S -o asm/gcc_control.s -std=c99 -DNO_RESTRICT
  $other_gcc $opts tests/test.c -S -o asm/gcc_c89.s -std=c89
  $other_gcc $opts tests/test.c -S -o asm/gcc_c99.s -std=c99
  $other_gcc $opts tests/test.cpp -S -o asm/gcc_cpp98.s -std=c++98
fi
