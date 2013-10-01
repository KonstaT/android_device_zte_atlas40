Device configuration to build [Firefox OS for ZTE Blade III](http://www.modaco.com/topic/360986-Firefox-OS/).

How to build:
-------------

[Initialize B2G build environment:](https://developer.mozilla.org/en-US/docs/Mozilla/Firefox_OS/Preparing_for_your_first_B2G_build)

    git clone https://github.com/mozilla-b2g/B2G.git
    cd B2G
    ./config.sh inari

Add support for Blade III:

    curl -L -o 0001-add-atlas40-to-config.sh.patch -O -L https://raw.github.com/KonstaT/android_device_zte_atlas40/b2g/build/0001-add-atlas40-to-config.sh.patch
    git am -3 0001-add-atlas40-to-config.sh.patch
    curl --create-dirs -L -o .repo/local_manifests/manifest_zte_atlas40.xml -O -L https://raw.github.com/KonstaT/android_device_zte_atlas40/b2g/build/manifest_zte_atlas40.xml
    ./config.sh atlas40

Build:

    ./build.sh
