Device configuration to build Code Aurora Forum Android for ZTE Blade III.

How to build:
-------------

Initialize build environment:

    repo init -u git://codeaurora.org/platform/manifest.git -b ics_chocolate_rb4 -m M76XXUSNEKNLYA2040.xml
    curl --create-dirs -L -o .repo/local_manifests/manifest_zte_atlas40.xml -O -L https://raw.github.com/KonstaT/android_device_zte_atlas40/ics_chocolate_rb4.2/patches/manifest_zte_atlas40.xml
    repo sync

Build:

    . build/envsetup.sh
    choosecombo 1 atlas40 userdebug
    make otapackage
