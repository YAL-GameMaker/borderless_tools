@echo off

if not exist "borderless_tools-for-GMS1" mkdir "borderless_tools-for-GMS1"
cmd /C copyre ..\borderless_tools.gmx\extensions\borderless_tools.extension.gmx borderless_tools-for-GMS1\borderless_tools.extension.gmx
cmd /C copyre ..\borderless_tools.gmx\extensions\borderless_tools borderless_tools-for-GMS1\borderless_tools
cmd /C copyre ..\borderless_tools.gmx\datafiles\borderless_tools.html borderless_tools-for-GMS1\borderless_tools\Assets\datafiles\borderless_tools.html
cd borderless_tools-for-GMS1
cmd /C 7z a borderless_tools-for-GMS1.7z *
move /Y borderless_tools-for-GMS1.7z ../borderless_tools-for-GMS1.gmez
cd ..

if not exist "borderless_tools-for-GMS2\extensions" mkdir "borderless_tools-for-GMS2\extensions"
if not exist "borderless_tools-for-GMS2\datafiles" mkdir "borderless_tools-for-GMS2\datafiles"
if not exist "borderless_tools-for-GMS2\datafiles_yy" mkdir "borderless_tools-for-GMS2\datafiles_yy"
cmd /C copyre ..\borderless_tools_yy\extensions\borderless_tools borderless_tools-for-GMS2\extensions\borderless_tools
cmd /C copyre ..\borderless_tools_yy\datafiles\borderless_tools.html borderless_tools-for-GMS2\datafiles\borderless_tools.html
cmd /C copyre ..\borderless_tools_yy\datafiles_yy\borderless_tools.html.yy borderless_tools-for-GMS2\datafiles_yy\borderless_tools.html.yy
cd borderless_tools-for-GMS2
cmd /C 7z a borderless_tools-for-GMS2.zip *
move /Y borderless_tools-for-GMS2.zip ../borderless_tools-for-GMS2.yymp
cd ..

if not exist "borderless_tools-for-GMS2.3+\extensions" mkdir "borderless_tools-for-GMS2.3+\extensions"
if not exist "borderless_tools-for-GMS2.3+\datafiles" mkdir "borderless_tools-for-GMS2.3+\datafiles"
cmd /C copyre ..\borderless_tools_23\extensions\borderless_tools borderless_tools-for-GMS2.3+\extensions\borderless_tools
cmd /C copyre ..\borderless_tools_23\datafiles\borderless_tools.html borderless_tools-for-GMS2.3+\datafiles\borderless_tools.html
cd borderless_tools-for-GMS2.3+
cmd /C 7z a borderless_tools-for-GMS2.3+.zip *
move /Y borderless_tools-for-GMS2.3+.zip ../borderless_tools-for-GMS2.3+.yymps
cd ..

pause