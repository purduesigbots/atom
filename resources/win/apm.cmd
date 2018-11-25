@echo off

IF "%ATOM_HOME%"=="" SET ATOM_HOME=%USERPROFILE%\.pros-editor
"%~dp0\..\app\apm\bin\apm.cmd" %*
