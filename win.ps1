
if (Test-Path asm){
  rm -r "asm"
}
mkdir asm
cp tests/test.c tests/test.cpp

function set_assembly {

  param(
    [string]$to_be,
    [string]$with_defines,
    [ValidateSet("/std:c11", "/std:c++14")][string]$with_standard
  )

  if ($with_standard -ceq "/std:c11"){
    cl /O2 /FA tests/test.c $with_defines
  } else {
    cl /O2 /FA tests/test.cpp $with_defines
  }
  rename-item -path test.asm -newname $to_be
  move-item -path $to_be -destination "asm"

}

gcm cl
if ($?) {
  set_assembly -to_be "cl_control.asm" -with_defines "/DNO_RESTRICT" -with_standard "/std:c11"
  set_assembly -to_be "cl_c11.asm" -with_standard "/std:c11"
  set_assembly -to_be "cl_c++14.asm" -with_standard "/std:c++14"
}

gcm clang
if ($?) {
  clang -Weverything -Wno-unsafe-buffer-usage -O3 tests/test.c -S -o asm/clang_control.asm -std=c99 -DNO_RESTRICT
  clang -Weverything -Wno-unsafe-buffer-usage -O3 tests/test.c -S -o asm/clang_c89.asm -std=c89
  clang -Weverything -Wno-unsafe-buffer-usage -O3 tests/test.c -S -o asm/clang_c99.asm -std=c99
  clang -Weverything -Wno-unsafe-buffer-usage -Wno-old-style-cast -O3 tests/test.cpp -S -o asm/clang_cpp98.asm -std=c++98
}

gcm gcc
if ($?) {
  gcc -Wall -Wextra -Wpedantic -O3 tests/test.c -S -o asm/gcc_control.asm -std=c99 -DNO_RESTRICT
  gcc -Wall -Wextra -Wpedantic -O3 tests/test.c -S -o asm/gcc_c89.asm -std=c89
  gcc -Wall -Wextra -Wpedantic -O3 tests/test.c -S -o asm/gcc_c99.asm -std=c99
  gcc -Wall -Wextra -Wpedantic -O3 tests/test.cpp -S -o asm/gcc_cpp98.asm -std=c++98
}
