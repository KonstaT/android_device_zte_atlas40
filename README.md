CyanogenMod 10.1 device configuration for ZTE Blade III.

http://www.modaco.com/topic/360987-cyanogenmod-10.1

How to build:
-------------

Initialize repo:

    repo init -u git://github.com/CyanogenMod/android.git -b cm-10.1
    curl -L -o .repo/local_manifests/local_manifest.xml -O -L https://raw.github.com/legaCyMod/android_local_manifest/cm-10.1/local_manifest.xml
    curl -L -o .repo/local_manifests/manifest_zte_atlas40.xml -O -L https://raw.github.com/legaCyMod/android_local_manifest/cm-10.1/manifest_zte_atlas40.xml
    repo sync

Compile:

    . build/envsetup.sh && lunch cm_atlas40-userdebug
    make bacon -j8

