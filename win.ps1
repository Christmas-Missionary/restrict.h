mkdir asm
cp tests/test.c tests/test.cpp

gcm clang
if ($?) {
  clang -Wall -Wextra -Wpedantic -O3 tests/test.c -S -o asm/clang_control.asm -std=c99 -DNO_RESTRICT
  clang -Wall -Wextra -Wpedantic -O3 tests/test.c -S -o asm/clang_c89.asm -std=c89
  clang -Wall -Wextra -Wpedantic -O3 tests/test.c -S -o asm/clang_c99.asm -std=c99
  clang -Wall -Wextra -Wpedantic -O3 tests/test.cpp -S -o asm/clang_cpp98.asm -std=c++98
}

gcm gcc
if ($?) {
  gcc -Wall -Wextra -Wpedantic -O3 tests/test.c -S -o asm/gcc_control.asm -std=c99 -DNO_RESTRICT
  gcc -Wall -Wextra -Wpedantic -O3 tests/test.c -S -o asm/gcc_c89.asm -std=c89
  gcc -Wall -Wextra -Wpedantic -O3 tests/test.c -S -o asm/gcc_c99.asm -std=c99
  gcc -Wall -Wextra -Wpedantic -O3 tests/test.cpp -S -o asm/gcc_cpp98.asm -std=c++98
}
