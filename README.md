#Welcome to Lua Tic-Tac-Toe

The first step is to install Lua.  We will be using Lua 5.2.2

###Download and installation instructions

#####Download
These instructions will be for setting up on a mac.  They are taken from [lua.org](http://www.lua.org/manual/5.2/readme.html)

If you would like to use Windows, you can follow the instructions [here](http://www.lua.org/manual/5.2/readme.html)

1.Download Lua [here](http://www.lua.org/versions.html#5.2)

#####Build it
2.a.Open a terminal window and move to the top-level directory, which is named lua-5.2.2. The Makefile there controls both the build process and the installation process.
  b.type "make macosx"
The compilation takes only a few moments and produces three files in the src directory: lua (the interpreter), luac (the compiler), and liblua.a (the library).

To check that Lua has been built correctly, do "make test" after building Lua. This will run the interpreter and print its version string.

#####Install it
Type "make install"






