SET SRC_DIR=%CD: =%|| exit /b

SET PATH=%SRC_DIR%\depot_tools;%PATH% || exit /b

REM Prevent depot_tools from downloading visual studios
SET DEPOT_TOOLS_WIN_TOOLCHAIN=0 || exit /b
REM Tell toolchain to use VC2015
SET gyp_msvs_version=2015 || exit /b

gclient || exit /b
gclient runhooks || exit /b

ECHO "Confirm that depot_tools python.bat is returned; NOT system Python."
WHERE python || exit /b

CD dart || exit /b
python tools/build.py --mode release --arch x64 create_sdk || exit /b

REM Install the compiled SDK
SETX DART_OUT %SRC_DIR%\out\ReleaseX64\dart_sdk
ROBOCOPY %DART_OUT%\bin %LIBRARY_BIN% /S
ROBOCOPY %DART_OUT%\include %LIBRARY_INC% /S
ROBOCOPY %DART_OUT%\lib %LIBRARY_LIB% /S
ECHO "This ECHO exists to make the return status 0."
