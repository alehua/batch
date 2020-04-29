@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
COLOR 0A
TITLE keith batch rename tool
ECHO.

ECHO.
ECHO 请选择要批量修改的处理的后缀名：
ECHO.
ECHO 1. 所有文件(只会修改文件名)
ECHO 2. txt
ECHO 3. png
ECHO 4. 其他,我自己来输入
ECHO.
CHOICE /C 1234 /m "你的选择是: "
IF %ERRORlEVEL% equ 1 SET suffix=*
IF %ERRORlEVEL% equ 2 SET suffix=txt
IF %ERRORlEVEL% equ 3 SET suffix=png
IF %ERRORlEVEL% equ 4 (
ECHO.
SET /P suffix="请输入要批量处理的后缀名: "
)

SET /a o=0
SET /a flag1=10
set /a flag2=100
ECHO 修改ing...
ECHO.
SET /a index=0

FOR %%i in (*.!suffix!) do (
    SET /a index=!index!+1
	IF !index! LSS !flag1! (
		SET name=!o!!o!!index!.!suffix!
	) ELSE IF !index! LSS !flag2! (
		SET name=!o!!index!.!suffix!
	) ELSE (
		SET name=!index!.!suffix!
	)
    REN "%%i" !name!
)

IF %ERRORlEVEL% equ 0 (
    ECHO 修改成功!
) ELSE (
    ECHO 修改失败!
)
ECHO.
PAUSE