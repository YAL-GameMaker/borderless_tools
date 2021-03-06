@echo off
set dllPath=%~1
set solutionDir=%~2
set projectDir=%~3
set arch=%~4
set config=%~5

echo Running post-build for %config%

set extName=borderless_tools
set extNameM=borderless_tools_m
set dllName=borderless_tools
set gmlDir14=%solutionDir%borderless_tools.gmx
set gmlDir22=%solutionDir%borderless_tools_yy
set gmlDir23=%solutionDir%borderless_tools_23
set ext14=%gmlDir14%\extensions\%extName%
set ext22=%gmlDir22%\extensions\%extName%
set ext23=%gmlDir23%\extensions\%extName%
set ext14m=%gmlDir14%\extensions\%extNameM%
set ext22m=%gmlDir22%\extensions\%extNameM%
set dllRel=%dllName%.dll
set cppRel=%dllName%.cpp
set cppPath=%ext23%\%cppRel%
set gmlPath=%ext23%\*.gml
set gmlPathM=%ext22m%\*.gml
set docName=%extName%.html
set docPath=%solutionDir%export\%docName%

echo Copying documentation...
copy /Y %docPath% %gmlDir23%\datafiles\%docName%
copy /Y %docPath% %gmlDir22%\datafiles\%docName%
copy /Y %docPath% %gmlDir14%\datafiles\%docName%

where /q gmxgen
if %ERRORLEVEL% EQU 0 (
	
	echo Combining the source files...
	type "%projectDir%*.h" "%projectDir%*.cpp" >"%cppPath%" 2>nul
	
	echo Running GmxGen...
	
	gmxgen "%ext23%\%extName%.yy" ^
	--copy "%dllPath%" "%dllRel%:%arch%"

	gmxgen "%ext22%\%extName%.yy" ^
	--copy "%dllPath%" "%dllRel%:%arch%" ^
	--copy "%cppPath%" "%cppRel%" ^
	--copy "%gmlPath%" "*.gml"
	
	gmxgen "%ext14%.extension.gmx" ^
	--copy "%dllPath%" "%dllRel%:%arch%" ^
	--copy "%cppPath%" "%cppRel%" ^
	--copy "%gmlPath%" "*.gml"
	:: pre-2.3 macros
	gmxgen "%ext22m%\%extNameM%.yy"

	gmxgen "%ext14m%.extension.gmx" ^
	--copy "%gmlPathM%" "*.gml"
) else (

	echo Copying DLLs...
	if "%arch%" EQU "x64" (
		copy /Y "%dllPath%" "%ext23%\%dllName%_x64.dll"
	) else (
		copy /Y "%dllPath%" "%ext22%\%dllRel%"
		copy /Y "%dllPath%" "%ext23%\%dllRel%"
		copy /Y "%dllPath%" "%ext14%\%dllRel%"
	)
	
	echo Copying GML files...
	robocopy %ext23% %ext22% *.gml /L >nul
	robocopy %ext23% %ext14% *.gml /L >nul
	robocopy %ext22m% %ext14% *.gml /L >nul

	echo postBuild.bat: Warning N/A: Could not find GmxGen - extensions will not be updated automatically. See https://github.com/YAL-GameMaker-Tools/GmxGen for setup.
)