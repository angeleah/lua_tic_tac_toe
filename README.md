#Welcome to Lua Tic-Tac-Toe

The first step is to get setup to run my program.  We will be using Lua 5.2.2, Luarocks 2.1.0, and Busted 1.9.0.

##Download and installation instructions-

Setting up Lua-
These instructions will be for setting up on a mac.  They are taken from [lua.org](http://www.lua.org/manual/5.2/readme.html)
If you would like to use Windows, you can follow the instructions [here](http://www.lua.org/manual/5.2/readme.html)

1.Download Lua [here](http://www.lua.org/versions.html#5.2)
2.a.Open a terminal window and move to the top-level directory, which is named lua-5.2.2. The Makefile there controls both the build process and the installation process.
  b.Type "make macosx". The compilation takes only a few moments and produces three files in the src directory: lua (the interpreter), luac (the compiler), and liblua.a (the library).  To check that Lua has been built correctly, do "make test" after building Lua. This will run the interpreter and print its version string. It should be 5.2.2
3.Type "make install"

Get Luarocks-
1.[Download](http://luarocks.org/en/Release_history) and unpack the LuaRocks tarball. Use luarocks-2.1.0-rc2.tar.gz 15-Jul-2013 15:20  91K.
2.cd to the luarocks-0.1/ in the location that it is at and type "./configure"
3.Type "make"
4.As a superuser, run "make install"
*if you experience issuses, look [here](http://luarocks.org/en/Installation_instructions_for_Unix)
5. Check that you have version 2.1.0 by typing "luarocks"

Install the testing framework Busted-
1.Type "luarocks install busted"

*If you experience wget errors, run brew update wget and brew doctor to make sure that wget is linked properly.  Then run "luarocks install busted" again.  This should work.

##Running the specs-
1.Clone this project
2.cd into this project's root.
3.Type "busted" or "busted spec"





