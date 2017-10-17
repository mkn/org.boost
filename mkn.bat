

@ECHO off
SET PWD=%CD%
SET VERSION="boost-1.65.1"

IF NOT EXIST %PWD%\b (

git clone --depth 1 https://github.com/boostorg/boost -b %VERSION% b --recursive || exit 666 /b
CD b
FOR /f %%d in ('dir /b "%PWD%\b\libs"') do ^
IF EXIST "%PWD%\b\libs\%%d\include" ^
ROBOCOPY /s "%PWD%\b\libs\%%d\include\boost" "%PWD%\b\boost" /NFL /NDL /NJH /NJS /nc /ns /np

IF NOT EXIST "%PWD%\b\boost\numeric" mkdir %PWD%\b\boost\numeric
FOR /f %%d in ('dir /b "%PWD%\b\libs\numeric"') do ^
IF EXIST "%PWD%\b\libs\numeric\%%d\include" ^
ROBOCOPY /s "%PWD%\b\libs\numeric\%%d\include\boost" "%PWD%\b\boost" /NFL /NDL /NJH /NJS /nc /ns /np

)
