mode con lines=64
@echo off

SET BASEDIR=%~dp0
cd %BASEDIR%

REM Read configuration from config-tx.ini

for /f "delims=" %%i in (..\config-tx.ini) do (
set %%i
 )

REM Read configuration from rxonoff.ini

for /f %%i in (..\ini\rxonoff.ini) do (
set %%i
 )

CLS



:FREQUENCYTX

more ..\ini\frequency.ini
set /p TXFREQCHOICE=Please, choose your TX-Frequency 0-27 :

if /I "%TXFREQCHOICE%"=="0" set /p TXFREQUENCY=Please, choose your TX-Frequency (70Mhz-6Ghz), input in Hz :
if /I "%TXFREQCHOICE%"=="1" (SET TXFREQUENCY=2403.25e6)
if /I "%TXFREQCHOICE%"=="2" (SET TXFREQUENCY=2403.50e6)
if /I "%TXFREQCHOICE%"=="3" (SET TXFREQUENCY=2403.75e6)
if /I "%TXFREQCHOICE%"=="4" (SET TXFREQUENCY=2404.00e6)
if /I "%TXFREQCHOICE%"=="5" (SET TXFREQUENCY=2404.25e6)
if /I "%TXFREQCHOICE%"=="6" (SET TXFREQUENCY=2404.50e6)
if /I "%TXFREQCHOICE%"=="7" (SET TXFREQUENCY=2404.75e6)
if /I "%TXFREQCHOICE%"=="8" (SET TXFREQUENCY=2405.00e6)
if /I "%TXFREQCHOICE%"=="9" (SET TXFREQUENCY=2405.25e6)
if /I "%TXFREQCHOICE%"=="10" (SET TXFREQUENCY=2405.50e6)
if /I "%TXFREQCHOICE%"=="11" (SET TXFREQUENCY=2405.75e6)
if /I "%TXFREQCHOICE%"=="12" (SET TXFREQUENCY=2406.00e6)
if /I "%TXFREQCHOICE%"=="13" (SET TXFREQUENCY=2406.25e6)
if /I "%TXFREQCHOICE%"=="14" (SET TXFREQUENCY=2406.50e6)
if /I "%TXFREQCHOICE%"=="15" (SET TXFREQUENCY=2406.75e6)
if /I "%TXFREQCHOICE%"=="16" (SET TXFREQUENCY=2407.00e6)
if /I "%TXFREQCHOICE%"=="17" (SET TXFREQUENCY=2407.25e6)
if /I "%TXFREQCHOICE%"=="18" (SET TXFREQUENCY=2407.50e6)
if /I "%TXFREQCHOICE%"=="19" (SET TXFREQUENCY=2407.75e6)
if /I "%TXFREQCHOICE%"=="20" (SET TXFREQUENCY=2408.00e6)
if /I "%TXFREQCHOICE%"=="21" (SET TXFREQUENCY=2408.25e6)
if /I "%TXFREQCHOICE%"=="23" (SET TXFREQUENCY=2408.75e6)
if /I "%TXFREQCHOICE%"=="24" (SET TXFREQUENCY=2409.00e6)
if /I "%TXFREQCHOICE%"=="25" (SET TXFREQUENCY=2409.25e6)
if /I "%TXFREQCHOICE%"=="26" (SET TXFREQUENCY=2409.50e6)
if /I "%TXFREQCHOICE%"=="27" (SET TXFREQUENCY=2409.75e6)


:FREQUENCYRX
if "%RXL%"=="1" more ..\ini\frequency.ini
if "%RXL%"=="1" set /p RXFREQCHOICE=Please, choose your RX-Frequency 0-27 :

if /I "%RXFREQCHOICE%"=="0" if "%RXL%"=="1" set /p RXFREQUENCY=Please, choose your RX-Frequency, input in kHz :
if /I "%RXFREQCHOICE%"=="1" (SET RXFREQUENCY=10492750)
if /I "%RXFREQCHOICE%"=="2" (SET RXFREQUENCY=10493000)
if /I "%RXFREQCHOICE%"=="3" (SET RXFREQUENCY=10493250)
if /I "%RXFREQCHOICE%"=="4" (SET RXFREQUENCY=10493500)
if /I "%RXFREQCHOICE%"=="5" (SET RXFREQUENCY=10493750)
if /I "%RXFREQCHOICE%"=="6" (SET RXFREQUENCY=10494000)
if /I "%RXFREQCHOICE%"=="7" (SET RXFREQUENCY=10494250)
if /I "%RXFREQCHOICE%"=="8" (SET RXFREQUENCY=10494500)
if /I "%RXFREQCHOICE%"=="9" (SET RXFREQUENCY=10494750)
if /I "%RXFREQCHOICE%"=="10" (SET RXFREQUENCY=10495000)
if /I "%RXFREQCHOICE%"=="11" (SET RXFREQUENCY=10495250)
if /I "%RXFREQCHOICE%"=="12" (SET RXFREQUENCY=10495500)
if /I "%RXFREQCHOICE%"=="13" (SET RXFREQUENCY=10495750)
if /I "%RXFREQCHOICE%"=="14" (SET RXFREQUENCY=10496000)
if /I "%RXFREQCHOICE%"=="15" (SET RXFREQUENCY=10496250)
if /I "%RXFREQCHOICE%"=="16" (SET RXFREQUENCY=10496500)
if /I "%RXFREQCHOICE%"=="17" (SET RXFREQUENCY=10496750)
if /I "%RXFREQCHOICE%"=="18" (SET RXFREQUENCY=10497000)
if /I "%RXFREQCHOICE%"=="19" (SET RXFREQUENCY=10497250)
if /I "%RXFREQCHOICE%"=="20" (SET RXFREQUENCY=10497500)
if /I "%RXFREQCHOICE%"=="21" (SET RXFREQUENCY=10497750)
if /I "%RXFREQCHOICE%"=="23" (SET RXFREQUENCY=10498000)
if /I "%RXFREQCHOICE%"=="24" (SET RXFREQUENCY=10498250)
if /I "%RXFREQCHOICE%"=="25" (SET RXFREQUENCY=10498500)
if /I "%RXFREQCHOICE%"=="26" (SET RXFREQUENCY=10498750)
if /I "%RXFREQCHOICE%"=="27" (SET RXFREQUENCY=10499000)


REM TX
%mosquitto% -t %CMD_ROOT%/tx/frequency -m %TXFREQUENCY% -h %PLUTOIPMQTT%
echo TX-Frequency is set to %TXFREQUENCY%Mhz

REM GSE RX
if "%RXL%"=="1" set /a LONGFREQUENCY = %RXFREQUENCY% - %RXOFFSET% * 1000
if "%RXL%"=="1" %mosquitto% -t cmd/longmynd/frequency -m %LONGFREQUENCY% -h %PLUTOIPMQTT%

REM RX SR
if "%RXL%"=="1" more ..\ini\longmynd-sr.ini
if "%RXL%"=="1" set /p SRCHOICE=Please, choose your RX-Sample Rate (0-9) :
if /I "%SRCHOICE%"=="0" if "%RXL%"=="1" set /p RXSR=Please, choose your RX-Sample Rate (35-4000) :
if /I "%SRCHOICE%"=="1" if "%RXL%"=="1" (SET RXSR=35)
if /I "%SRCHOICE%"=="2" if "%RXL%"=="1" (SET RXSR=66)
if /I "%SRCHOICE%"=="3" if "%RXL%"=="1" (SET RXSR=125)
if /I "%SRCHOICE%"=="4" if "%RXL%"=="1" (SET RXSR=250)
if /I "%SRCHOICE%"=="5" if "%RXL%"=="1" (SET RXSR=333)
if /I "%SRCHOICE%"=="6" if "%RXL%"=="1" (SET RXSR=500)
if /I "%SRCHOICE%"=="7" if "%RXL%"=="1" (SET RXSR=1000)
if /I "%SRCHOICE%"=="8" if "%RXL%"=="1" (SET RXSR=1500)
if /I "%SRCHOICE%"=="9" if "%RXL%"=="1" (SET RXSR=2000)

if "%RXL%"=="1" %mosquitto% -t cmd/longmynd/sr -m %RXSR% -h %PLUTOIPMQTT%

if "%RXL%"=="1" echo Longmynd-Frequency is set to %LONGFREQUENCY%Khz
if "%RXL%"=="1" echo RX-Frequency is set to %RXFREQUENCY%Mhz
if "%RXL%"=="1" echo RX-Sample Rate is set to %RXSR%KS
if "%RXL%"=="1" timeout 10
GoTo FREQUENCYTX