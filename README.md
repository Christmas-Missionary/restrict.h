# As of C++23, there is no `restrict` keyword.
# This has not stopped GCC, Clang, and MSVC from implementing it anyway. 
# `restrict.h` is the compatibility wrapper, and provides the convenience macro, `RESTRICT`. 

***Why `RESTRICT`, and not `restrict`?***

Because of MSVC's `__declspec(restrict)`.

***Usage***

Copy and paste `restrict.h` into any of your projects.

***How do I know this works?***

On the top level of this repo:

If on MacOS or a Linux distro, given a Bash or Zsh shell:

  `./unix.sh`  

If on Windows, given a PowerShell shell:

  `./win.ps1`  

The assembly files' names that end with `control` (As in "control group") don't use `RESTRICT` via the macro `NO_RESTRICT`. Thus, they should be longer files.
