@Title OC2 - TP1 - Pesado , Vargas
@echo.
@Echo  -----------------------------------------------------------
@Echo  --Bienvenido al programa de compilacion de codigo fuente!--
@Echo  -----------------------------------------------------------
@echo.
@REM "MODIFICAR LAS RUTAS A NASM Y GCC PARA PODER UTILIZAR EL SISTEMA!"
@set RutaBAT=%~d0%~p0
@set RutaNASM="INGRESE SU RUTA AQUI" 
@set RutaGCC="INGRESE SU RUTA AQUI"

@ping localhost -n 2 >nul
@echo LAS RUTAS USADAS PARA COMPILAR LA APLICACION SERAN:
@Echo  ---------------------------------------------------------
@echo RUTA DE LOS ARCHIVOS FUENTE = %RutaBAT%
@echo RUTA DE NASM = %RutaNASM%
@echo RUTA DE GCC = %RutaGCC%
@echo RUTA DEL EJECUTABLE FINAL = %RutaBAT%
@echo.


@REM "A PARTIR DE ACA, NO SE DEBERIA MODIFICAR NINGUNA PARTE DEL CODIGO A CONTINUACION PARA QUE EL SISTEMA FUNCIONE CORRECTAMENTE"


@Echo  -----------------------------------------------------------
@ECHO  --PRESIONE UNA TECLA PARA COMENZAR A COMPILAR EL PROGRAMA--
@Echo  -----------------------------------------------------------
@PAUSE > nul

@cd /d %RutaNASM%
@echo CREANDO OBJ DE ASM
@ping localhost -n 3 >nul
@nasm -f win32 -o "%RutaBAT%fuenteASM.obj" "%RutaBAT%funcionesASM.asm" 
@ECHO OBJ CREADO CON EXITO!
@cd /d %RutaGCC%
@echo.

@echo CREANDO EJECUTABLE A PARTIR DE LOS ARCHIVOS DE CODIGO FUENTE
@ping localhost -n 3 >nul
@ gcc -m32 -o "%RutaBAT%TP1_OC2_PESADO_VARGAS.exe" "%RutaBAT%fuenteASM.obj" "%RutaBAT%Main.c" 
@rem gcc -m32 -o "%RutaBAT%TP1_OC2_PESADO_VARGAS.exe" "%RutaBAT%fuenteASM.obj" "%RutaBAT%main_prueba.c"  
@echo EJECUTABLE CREADO CON EXITO EN %RutaBAT%
@echo.

@cd  /d %RutaBAT%
@ECHO ELIMINANDO ARCHIVOS TEMPORALES
@ping localhost -n 3 >nul
@del /f /q fuenteASM.obj
@ECHO ARCHIVOS TEMPORALES ELIMINADOS! 
@echo.

@Echo  ------------------------------------------------------------------
@ECHO  --PRESIONE UNA TECLA PARA COMENZAR LA 1RA EJECUCION DEL PROGRAMA--
@Echo  ------------------------------------------------------------------
@echo.
@PAUSE > nul

@ECHO EJECUTANDO TP1_OC2_PESADO_VARGAS.exe , DESDE %RutaBAT%
@ECHO PREPARANDO APLICACION PARA LA PRIMERA EJECUCION...
@ping localhost -n 2 >nul
@ECHO PREPARANDO APLICACION PARA LA PRIMERA EJECUCION..
@ping localhost -n 2 >nul
@ECHO PREPARANDO APLICACION PARA LA PRIMERA EJECUCION.
@ping localhost -n 2 >nul 
@echo.
@ECHO LISTO!, EJECUTANDO...
@ping localhost -n 2 >nul
@echo.
@echo.

@TP1_OC2_PESADO_VARGAS

@echo.
@echo.
@ECHO MUCHAS GRACIAS POR UTILIZAR EL PROGRAMA!!
@ECHO RECUERDE QUE LA APLICACION ESTA EN %RutaBAT%
@echo.
@ECHO PRESIONE UNA TECLA PARA SALIR!!!
@PAUSE > nul
@CLS
EXIT