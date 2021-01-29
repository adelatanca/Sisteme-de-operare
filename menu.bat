@echo off
echo %1
echo %2

set hour=%time:~0,2%
set minutes=%time:~3,2%
set seconds=%time:~6,2%
set subdirectorTime=%hour%-%minutes%-%seconds%
mkdir %subdirectorTime%
cd ./%subdirectorTime%

echo Subdirector: %subdirectorTime%
echo Fisierul: %1
echo Subsir S: %2


:START
E:\FACULTATE\an3sem1\LabSO\TestSOTancaAdela\meniu
if not ErrorLevel 1 goto IESIRE
if not ErrorLevel 2 goto CREARE
if not ErrorLevel 3 goto CAUTA
if not ErrorLevel 4 goto AFISEAZA

:CREARE
Echo Optiunea aleasa este 1
Echo Introduceti datele:
copy con %1.txt
goto START

:CAUTA
Echo Optiunea aleasa este 2
IF NOT EXIST  %1.txt  echo Nu exista fisierul
echo Numarul de aparitii ale subsirului %2 sunt:
IF EXIST %1.txt findstr "%2" %1.txt | find /v "" /c
echo off

echo Subsirul %subsir% apare pe liniile:
IF EXIST %1.txt  FIND /N "%2" < %1.txt
IF EXIST %1.txt  FIND /N "%2" < %1.txt >> %fisierFsortatDescrescator%.txt
goto START

:AFISEAZA
Echo Optiunea aleasa este 3
IF NOT EXIST  %fisierFsortatDescrescator%.txt  echo Nu exista fisierul
IF EXIST %fisierFsortatDescrescator%.txt sort /R <%fisierFsortatDescrescator%.txt> fisierFsortatDescrescator.txt
echo Fisierul sortat descrescator:
type fisierFsortatDescrescator.txt
goto START

:IESIRE
echo Programul s-a terminat
cd..
