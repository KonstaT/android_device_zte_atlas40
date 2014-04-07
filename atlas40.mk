PRODUCT_PROPERTY_OVERRIDES += \
       dalvik.vm.heapstartsize=5m \
       dalvik.vm.heapgrowthlimit=36m \
       dalvik.vm.heapsize=128m

$(call inherit-product, device/qcom/common/common.mk)

PRODUCT_NAME := atlas40
PRODUCT_DEVICE := atlas40
PRODUCT_BRAND := ZTE
PRODUCT_MANUFACTURER := ZTE
PRODUCT_MODEL := BLADE III

#Bluetooth configuration files
PRODUCT_COPY_FILES += \
   system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf
