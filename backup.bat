
FORFILES /p Users\ejan\Documents\BACKUP_TEST -D -7 -C "CMD /C IF @ISDIR==TRUE ECHO rd /q /s @FILE&rd /q /s @FILE"

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%YYYY%%MM%%DD%"
set "timestamp=%YYYY%_%MM%_%DD%_%HH%:%Min%"

echo ***************************************************************************************************************************************************************** >> C:\Users\ejan\Documents\BACKUP_TEST\backuplog.log
echo *                                                                      %timestamp%                                                                         * >> C:\Users\ejan\Documents\BACKUP_TEST\backuplog.log
echo ***************************************************************************************************************************************************************** >> C:\Users\ejan\Documents\BACKUP_TEST\backuplog.log
robocopy C:\Users\ejan\Documents\BACKUP_TEST\ALT C:\Users\ejan\Documents\BACKUP_TEST\%datestamp% /MIR /FFT /R:3 /W:10 /Z /NP /NDL >> C:\Users\ejan\Documents\BACKUP_TEST\backuplog.log
