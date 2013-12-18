CyanogenMod 11 device configuration for ZTE Blade III.

http://www.modaco.com/topic/367241-cyanogenmod-11

How to build:
-------------

Initialize repo:

    repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0
    curl --create-dirs -L -o .repo/local_manifests/local_manifest.xml -O -L https://raw.github.com/legaCyMod/android_local_manifest/cm-11.0/local_manifest.xml
    curl -L -o .repo/local_manifests/manifest_zte_atlas40.xml -O -L https://raw.github.com/legaCyMod/android_local_manifest/cm-11.0/manifest_zte_atlas40.xml
    repo sync

Compile:

    . build/envsetup.sh
    brunch atlas40

