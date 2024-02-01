@echo off
title YouTube video EZ download

echo.Update yt-dlp? (y/n)
set /p update=""

if "%update%" == "y" (
echo.Updating yt-dlp
yt-dlp --proxy socks5://127.0.0.1:10808 -U
)

echo.Choose method
echo.1. Full video, best quality
echo.2. Audio only
echo.3. Bilibili (H.265 default)
echo.4. Bilibili Danmaku
@REM echo.4. List subs, download

set /p method=""

echo.link of the video (BV number for Bilibili videos):
set /p link=""

if "%method%" == "1" (
yt-dlp -f bestvideo+bestaudio -i --proxy socks5://127.0.0.1:10808 %link%
) else if "%method%" == "2" (
yt-dlp -x -f bestaudio --proxy socks5://127.0.0.1:10808 %link%
) else if "%method%" == "3" (
BBDown %link% -p ALL -e hevc,av1,avc --skip-cover --download-danmaku
) else if "%method%" == "4" (
BBDown %link% -p ALL --danmaku-only
)
@REM else if "%method%" == "-------" (
@REM yt-dlp --proxy socks5://127.0.0.1:10808 --list-subs -q %link%
@REM echo.Auto Subs? y/n
@REM set /p auto=""
@REM echo.Language?
@REM set /p lang=""
@REM if "%auto%" == "y"(
@REM yt-dlp --write-auto-sub --sub-lang %lang% --skip-download --proxy socks5://127.0.0.1:10808 %link%
@REM )
@REM else if "%auto%" == "n"(
@REM yt-dlp --write-sub --sub-lang %lang% --skip-download --sub-format ass --proxy socks5://127.0.0.1:10808 %link%
@REM ) else (
@REM echo.False command, run again. (method 3)
@REM )

pause