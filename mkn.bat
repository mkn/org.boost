

@ECHO off
SET PWD=%CD%
IF NOT EXIST %PWD%\b (
	git clone https://github.com/boostorg/boost -b master b --recursive
	CD b
	FOR /f %%d in ('dir /b %PWD%\b\libs') do IF EXIST %PWD%\b\libs\%%d\include ROBOCOPY /s %PWD%\b\libs\%%d\include\boost %PWD%\b\boost /NFL /NDL /NJH /NJS /nc /ns /np
)
