@echo off
if not exist ..\build mkdir ..\build
pushd ..\build
del *.pdb > NUL 2> NULL
echo WAITING FOR PDB > lock.tmp

cl -Zi -FC -Wall source.c /link -incremental:no 

del lock.tmp
del *.obj

REM Compiler Switches:

REM Zi	: Debug info
REM Zo	: Debug info for optimized code
REM FC    : Full path on errors
REM EHsc  : Disable C++ exceptions
REM GL	: Enables whole program optimization
REM Fdfile.pdb : Rename the pdb file
REM Fmfile.map : Output segment map file
REM fp:fast    : Optimize fp operations for speed
REM LD	: Creates a DLL
REM MT    : Creates multithreaded executable
REM MTd   : Creates debug multithreaded executable
REM O2    : Optimizes for speed
REM Od	: Disables optimization
REM Oi	: Enables intrinsics
REM showIncludes : Shows files included in the compilation
REM W4	: Make all warnings trigger as Wall
REM WX    : Treat warnings as errors
REM wd1234 : Disable warning 1234

REM Linker Options:

REM opt:ref : Removes unused functions from executable
REM subsystem:console : Console application
