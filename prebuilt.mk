# Ramdisk
PRODUCT_COPY_FILES := \
  $(call find-copy-subdir-files,*,device/zte/atlas40/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
  $(call find-copy-subdir-files,*,device/zte/atlas40/prebuilt/system,system)
