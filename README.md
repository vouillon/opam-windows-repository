opam-windows-repository
=======================

OCaml cross-compilers for Windows: packages description for OPAM

---

* How to install:  
  `$ opam switch 4.00.1`  
  `$ opam repo add win https://github.com/vouillon/opam-windows-repository.git`  
  `$ opam install win32-ocaml win64-ocaml win64-lablgtk win64-ssl [...]`  

* Example of use:  
  `$ x86_64-w64-mingw32-ocamlopt hello.ml -o hello.exe`  
  `$ x86_64-w64-mingw32-ocamlopt -I +../lablgtk2 lablgtk.cmxa gtkInit.cmx filesel.ml -o filesel.exe`  

* How to search (currently supported) packages for Windows:  
  `$ opam search win32`  
  `$ opam search win64`  

* Important files:
  * OCaml virtual machines for Windows (bytecode mode):
    * `~/.opam/4.00.1/{i686,x86_64}-w64-mingw32/bin/ocamlrun.exe`
  * Gtk dlls needed at execution time:
    * `~/.opam/4.00.1/{i686,x86_64}-w64-mingw32/lib/gtk/bin/*.dll`
