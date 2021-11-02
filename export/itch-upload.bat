@echo off
set /p ver="Version?: "
echo Uploading %ver%...
set user=yellowafterlife
set ext=gamemaker-borderless_tools
cmd /C itchio-butler push borderless_tools-for-GMS1.gmez %user%/%ext%:gms1 --userversion=%ver%
cmd /C itchio-butler push borderless_tools-for-GMS2.yymp %user%/%ext%:gms2 --userversion=%ver%
cmd /C itchio-butler push borderless_tools-for-GMS2.3+.yymps %user%/%ext%:gms2.3 --userversion=%ver%

pause