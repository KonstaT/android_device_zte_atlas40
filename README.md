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
        <!-- ZTE Blade III -->
        <project path="device/zte/atlas40" name="KonstaT/android_device_zte_atlas40" revision="jellybean" />
        <project path="kernel/zte/msm7x27a" name="KonstaT/android_kernel_zte_msm7x27a" revision="jellybean" />
        <project path="vendor/zte" name="KonstaT/proprietary_vendor_zte" revision="jellybean" />

        <!-- FM Radio -->
        <project path="hardware/qcom/fm" name="legaCyMod/android_hardware_qcom_fm" revision="jellybean" />
        <project path="packages/apps/FM2" name="legaCyMod/android_packages_apps_FM2" revision="jellybean" />
    </manifest>

Compile:

    . build/envsetup.sh
    brunch atlas40

