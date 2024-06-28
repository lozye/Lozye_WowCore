@echo off
set info=%1
if (%info%) == () set info= "retail"

set wow_folder=C:\Users\Lozye-Work\Desktop\新建文件夹
set target=""
if "%info%" == "wlk" (
    set target="%wow_folder%\_classic_\Interface\AddOns\LozyeWow\"
) else (
    set target="%wow_folder%\_retail_\Interface\AddOns\LozyeWow\"
)

echo ==========================
echo PUSH TO %target%

:: cp
xcopy /s src\ %target%