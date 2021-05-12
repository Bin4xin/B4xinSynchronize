@echo off
rem ---------------------------------------------------------------------------
rem Start script for the CATALINA Server
rem ---------------------------------------------------------------------------

setlocal
::set ENV_PATH=%PATH%
::
set "CURRENT_DIR=%cd%"

if not "%RSYNC_HOME%" == "" goto gotHome
set "RSYNC_HOME=%CURRENT_DIR%\cwRsync_5.4.1"
@echo %RSYNC_HOME%
@echo --------------
@echo --------------
%RSYNC_HOME%\rsync.exe



REM %~dp0\..\cwRsync_5.4.1\rsync.exe --help 