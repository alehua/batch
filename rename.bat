@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
COLOR 0A
TITLE keith batch rename tool
ECHO.

ECHO.
ECHO ��ѡ��Ҫ�����޸ĵĴ���ĺ�׺����
ECHO.
ECHO 1. �����ļ�(ֻ���޸��ļ���)
ECHO 2. txt
ECHO 3. png
ECHO 4. ����,���Լ�������
ECHO.
CHOICE /C 1234 /m "���ѡ����: "
IF %ERRORlEVEL% equ 1 SET suffix=*
IF %ERRORlEVEL% equ 2 SET suffix=txt
IF %ERRORlEVEL% equ 3 SET suffix=png
IF %ERRORlEVEL% equ 4 (
ECHO.
SET /P suffix="������Ҫ��������ĺ�׺��: "
)

SET /a o=0
SET /a flag1=10
set /a flag2=100
ECHO �޸�ing...
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
    ECHO �޸ĳɹ�!
) ELSE (
    ECHO �޸�ʧ��!
)
ECHO.
PAUSE