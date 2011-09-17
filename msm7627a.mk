$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product-if-exists, vendor/qcom/proprietary/tools/google/gingerbread/products/mini-gms.mk)

PRODUCT_NAME := msm7627a
PRODUCT_DEVICE := msm7627a

PRODUCT_PROPERTY_OVERRIDES += \
   ro.com.google.clientidbase=android-qualcomm
