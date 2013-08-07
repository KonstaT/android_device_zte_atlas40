CyanogenMod 10.2 device configuration for ZTE Blade III.

http://www.modaco.com/topic/364042-cyanogenmod-10.2

How to build:
-------------

Initialize repo:

    repo init -u git://github.com/CyanogenMod/android.git -b cm-10.2
    curl --create-dirs -L -o .repo/local_manifests/local_manifest.xml -O -L https://raw.github.com/legaCyMod/android_local_manifest/cm-10.2/local_manifest.xml
    curl -L -o .repo/local_manifests/manifest_zte_atlas40.xml -O -L https://raw.github.com/legaCyMod/android_local_manifest/cm-10.2/manifest_zte_atlas40.xml
    repo sync

Compile:

    . build/envsetup.sh
    brunch atlas40

