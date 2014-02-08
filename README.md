opam-windows-repository
=======================

OCaml cross-compilers for Windows: packages description for OPAM

---

* Prerequisites:
  * C cross-compiler: `i686-w64-mingw32-gcc` and/or `x86_64-w64-mingw32-gcc`

* How to install:  
  `$ opam switch 4.00.1`  
  `$ opam repo add win https://github.com/vouillon/opam-windows-repository.git`  
  `$ opam install win32-ocaml win64-ocaml win64-lablgtk win64-ssl [...]`  

* Example of use:  
  `$ x86_64-w64-mingw32-ocamlopt hello.ml -o hello.exe`  
  `$ x86_64-w64-mingw32-ocamlopt -I +../lablgtk2 lablgtk.cmxa gtkInit.cmx
     filesel.ml -o filesel.exe`  

* How to search (currently supported) packages for Windows:  
  `$ opam search win32`  
  `$ opam search win64`  

* Important files:
  * OCaml virtual machines for Windows (bytecode mode):
    * `~/.opam/4.00.1/{i686,x86_64}-w64-mingw32/bin/ocamlrun.exe`
  * Gtk dlls needed at execution time:
    * `~/.opam/4.00.1/{i686,x86_64}-w64-mingw32/lib/gtk/bin/*.dll`

* Issues:
  * To compile i686 packages on x86_64 machines, need the glibc.i686 package
  * On old fedora versions (< 17), the C cross-compiler for i686 was named
    `i686-pc-mingw32-gcc` and not `i686-w64-mingw32-gcc`. Please run
    some `ln -sf` commands to fix it before installing ocaml cross-compilers
