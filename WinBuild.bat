echo Delete files from %1...
del /s /q %1\assets
del /s /q %1\res
del /s /q %1\AndroidManifest.xml

echo Copy files to %1...
xcopy .\assets %1
xcopy .\res %1
xcopy .\AndroidManifest.xml %1

echo 
echo If you would like to prepare for a game modes build, then edit the files
echo in %1 to do so.
