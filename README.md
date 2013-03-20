CyanogenMod 10 device configuration for ZTE Blade III.

http://www.modaco.com/topic/360513-cyanogenmod-10/

How to build:
-------------

Initialize CyanogenMod repo:

    repo init -u git://github.com/CyanogenMod/android.git -b jellybean
    repo sync

Add the following to your cm10/.repo/local_manifests/local_manifest.xml and repo sync again:

    <?xml version="1.0" encoding="UTF-8"?>
    <manifest>
        <project name="KonstaT/android_device_zte_atlas40" path="device/zte/atlas40" revision="jellybean" />
        <project name="KonstaT/proprietary_vendor_zte" path="vendor/zte" revision="jellybean" />
        <project name="KonstaT/zte-kernel-msm7x27a" path="kernel/zte/zte-kernel-msm7x27a" revision="jellybean" />
    </manifest>

Compile:

    . build/envsetup.sh && lunch cm_atlas40-userdebug
    make bacon -j8

