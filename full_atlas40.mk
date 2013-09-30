$(call inherit-product, device/qcom/common/common.mk)

# Ramdisk
PRODUCT_COPY_FILES := \
  $(call find-copy-subdir-files,*,device/zte/atlas40/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
  $(call find-copy-subdir-files,*,device/zte/atlas40/prebuilt/system,system)

$(call inherit-product-if-exists, vendor/zte/atlas40/atlas40-vendor-blobs.mk)
$(call inherit-product-if-exists, vendor/qcom/common/vendor-blobs.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
  rild.libpath=/system/lib/libril-qc-1.so \
  rild.libargs=-d/dev/smd0 \
  ril.subscription.types=NV,RUIM \
  DEVICE_PROVISIONED=1 \
  ro.use_data_netmgrd=true \
  ro.moz.cam.0.sensor_offset=270 \
  ro.moz.ril.emergency_by_default=true \
  ro.moz.omx.hw.max_width=640 \
  ro.moz.omx.hw.max_height=360

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_atlas40
PRODUCT_DEVICE := Blade III
PRODUCT_BRAND := ZTE
PRODUCT_MANUFACTURER := ZTE
PRODUCT_MODEL := atlas40
ENABLE_LIBRECOVERY := true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
  persist.usb.serialno=$(PRODUCT_NAME)
