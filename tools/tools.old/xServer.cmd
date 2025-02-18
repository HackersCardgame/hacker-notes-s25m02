

C:\Users\marc\PsTools\pskill.exe vcxsrv

taskkill /IM VcXsrv.exe /T /f

start cmd.exe /c "C:\Program Files\VcXsrv\vcxsrv.exe" -multiwindow -clipboard -wgl -ac


REM wsl -d Ubuntu-18.04 -u marc -e "gnome-terminal &"

REM export DISPLAY=192.168.1.233:0


REM start cmd.exe /c wsl -d Ubuntu-18.04 -u marc -e "DISPLAY=192.168.1.233 gnome-terminal"
REM start cmd.exe /c wsl -d Ubuntu-18.04 -u marc

REM export DISPLAY="$(ipconfig.exe  |grep 192 |head -n1|cut -d: -f2 |cut -c 2-|tr -d '\r')"":0"