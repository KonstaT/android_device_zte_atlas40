$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/atlas40/atlas40-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/atlas40/overlay

LOCAL_PATH := device/zte/atlas40
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/zte/atlas40/recovery/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/zte/atlas40/recovery/sbin/rmt_storage_recovery:/root/sbin/rmt_storage_recovery \
    device/zte/atlas40/ramdisk/ueventd.rc:root/ueventd.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_atlas40
PRODUCT_DEVICE := atlas40
