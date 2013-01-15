## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/atlas40/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := atlas40
PRODUCT_NAME := cm_atlas40
PRODUCT_BRAND := zte
PRODUCT_MODEL := atlas40
PRODUCT_MANUFACTURER := ZTE
PRODUCT_RELEASE_NAME := Blade III
