@echo off
:: PortfolioRP FiveM Server Startup Script
:: This script starts your FiveM server with the configured settings

echo ========================================
echo Starting PortfolioRP FiveM Server
echo ========================================
echo.

:: Check if FXServer.exe exists in the server directory
if not exist "server\FXServer.exe" (
    echo ERROR: FXServer.exe not found!
    echo.
    echo Please download the FiveM server files from:
    echo https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/
    echo.
    echo Extract the files to the 'server' directory.
    echo.
    pause
    exit /b 1
)

:: Check if server.cfg exists
if not exist "server.cfg" (
    echo ERROR: server.cfg not found!
    echo.
    echo The server configuration file is missing.
    echo.
    pause
    exit /b 1
)

:: Start the server
echo Starting FXServer...
echo.
echo Press Ctrl+C to stop the server
echo.

cd /d server
FXServer.exe +exec ../server.cfg

:: If the server stops, pause to see any error messages
echo.
echo ========================================
echo Server has stopped
echo ========================================
pause