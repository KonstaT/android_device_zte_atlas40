## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/atlas40/atlas40.mk)

# Correct boot animation size for the screen.
TARGET_BOOTANIMATION_NAME := vertical-480x800

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := atlas40
PRODUCT_NAME := cm_atlas40
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := Blade III
PRODUCT_MANUFACTURER := ZTE
PRODUCT_RELEASE_NAME := Blade III

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=P772N10 BUILD_FINGERPRINT=ZTE/P772N10/atlas40:4.0.4/IMM76D/20121125.234016.9781:user/release-keys PRIVATE_BUILD_DESC="P772N10-user 4.0.4 IMM76D 20121125.234016.9781 release-keys" BUILD_NUMBER=20121125.234016.9781
