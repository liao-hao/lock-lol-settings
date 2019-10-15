@echo off
echo ****************************************  

echo .


set RADS_PATH=%cd%\Game\Config
set staus=0

if exist %RADS_PATH% (
	echo 	已经找到lol配置文件
	ECHO.
	set RADS_PATH=%RADS_PATH%\PersistedSettings.json
	goto panduan
	
) else (
    echo !!  
    echo !!  
    echo !!		执行失败，请放在lol根目录
    echo !!  
    echo !!  
    goto test

)

:panduan
attrib "%RADS_PATH%" | findstr "^.....R">nul && set staus=1
if /i {%staus%}=={0} goto :job_1
if /i {%staus%}=={1} goto :job_2


:job_1
ECHO -------------------------------------
ECHO.
ECHO.
ECHO 	当前为 ：	不是只读
ECHO.
ECHO 	设置成 ： 	只读
ECHO.
ECHO.
ECHO -------------------------------------
attrib +r "%RADS_PATH%"
goto tuichu

:job_2
ECHO -------------------------------------
ECHO.
ECHO 	当前为 ：	只读
ECHO.
ECHO 	设置成 ：	取消只读
ECHO.
ECHO.
ECHO -------------------------------------
attrib -r "%RADS_PATH%"
goto tuichu

:tuichu
set staus=0
attrib "%RADS_PATH%" | findstr "^.....R">nul && set staus=1
ECHO. 
ECHO 	更新设置文件状态......
ECHO. 
ECHO. 
if /i {%staus%}=={1} echo 		只读、设置改不动了
if /i {%staus%}=={0} echo 		不是只读、设置可以更改
ECHO. 
ECHO. 
ECHO. 
echo ****************************************  
ECHO. 


:test
pause


