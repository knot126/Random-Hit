# Build Random Hit

## On Linux with APK Editor Studio

This is the only build process that is confirmed to work.

1. Open the clean (target) APK in APK Editor Studio
2. Copy the path you get from opening the contents
3. Open a terminal window
4. Run `./DeleteCopy.sh` in this directory.
5. Paste the path to the files when asked
6. (Optional) Edit AndroidManifest.xml and assets/menu/main.lua to support the game modes menu and legal purchasing of premium
7. Go back to APK Editor Studio and save the APK
8. Test it, then do what you would like to do with the APK that is built

## On Windows with APK Editor Studio

*There are no directions at the moment.*

You need to copy `assets`, `res`, and `AndroidManifest.xml` into your clean APK. Prepare for a premium build if needed.
