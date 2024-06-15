@echo off
set wow_dir="D:\Games\World of Warcraft\_classic_\Fonts"

set info=%1
set error=0
if (%info%) == () set error=1

if %error% EQU 0 (
    copy %info% %wow_dir%\ARHei.ttf
    copy %info% %wow_dir%\ARKai_C.ttf
    copy %info% %wow_dir%\Frizqt__.ttf
    copy %info% %wow_dir%\ARKai_T.ttf   
)