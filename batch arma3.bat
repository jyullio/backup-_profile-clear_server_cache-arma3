@echo off

::	clear server cache ---------------------------------------------------------------------------------------
:clear_server_cache

setlocal

set path_server_cache="%LOCALAPPDATA%\Arma 3\MPMissionsCache"

if exist %path_server_cache% (cd %path_server_cache% & del *.*) else (echo the path = %path_server_cache% don't exist)

endlocal

::profile backup --------------------------------------------------------------------------------------------
:profile_backup

setlocal

set year=%Date:~6,4%
set month=%Date:~3,2%
set day=%Date:~0,2%

set hour=%time:~0,2%
set minutes=%time:~3,2%

set	backup_name=%day%_%month%_%year% -- %hour%_%minutes%

set path_of_profile="C:\Users\%USERNAME%\OneDrive\Documentos\Arma 3"

set	path_cur_backup="C:\Users\%USERNAME%\OneDrive\Documentos\Arma 3 backup\%backup_name%"


::copiando pasta arma 3 presente na pasta documentos para pasta de backups
if exist %path_of_profile% if not exist %path_cur_backup% (robocopy %path_of_profile% %path_cur_backup% /e)

endlocal

::open arma 3 launcher ---------------------------------------------------------------------------------------
:open_arma3
setlocal
set path_arma3launcher="C:\Program Files (x86)\Steam\steamapps\common\Arma 3\arma3launcher.exe"

start "" %path_arma3launcher%

endlocal

::pause .bat --------------------------------------------------------------------------------------------------
pause

