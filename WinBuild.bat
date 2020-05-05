@echo off
echo Delete files from %1...
del /F /S /Q %1\assets
del /F /S /Q %1\res
del /F /S /Q %1\AndroidManifest.xml

echo Copy files to %1...
xcopy /J /Y /E .\assets %1
xcopy /J /Y /E .\res %1
xcopy /J /Y /E .\AndroidManifest.xml %1

echo 
echo If you would like to prepare for a game modes build, then edit the files
echo in %1 to do so.
