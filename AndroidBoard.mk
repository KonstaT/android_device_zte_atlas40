LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------------
# Compile (L)ittle (K)ernel bootloader and the nandwrite utility
#----------------------------------------------------------------------
ifneq ($(strip $(TARGET_NO_BOOTLOADER)),true)

# Compile
include bootable/bootloader/lk/AndroidBoot.mk

INSTALLED_BOOTLOADER_TARGET := $(PRODUCT_OUT)/bootloader
file := $(INSTALLED_BOOTLOADER_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_BOOTLOADER) | $(ACP)
	$(transform-prebuilt-to-target)

# Copy nandwrite utility to target out directory
INSTALLED_NANDWRITE_TARGET := $(PRODUCT_OUT)/nandwrite
file := $(INSTALLED_NANDWRITE_TARGET)
ALL_PREBUILT += $(file)
$(file) : $(TARGET_NANDWRITE) | $(ACP)
	$(transform-prebuilt-to-target)
endif

#----------------------------------------------------------------------
# Compile Linux Kernel
#----------------------------------------------------------------------
ifeq ($(KERNEL_DEFCONFIG),)
    KERNEL_DEFCONFIG := msm7627a-perf_defconfig
endif

include kernel/AndroidKernel.mk

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file) : $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := surf_keypad.kcm
LOCAL_MODULE_TAGS := optional
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := 7x27a_kp.kcm
LOCAL_MODULE_TAGS := optional
include $(BUILD_KEY_CHAR_MAP)

file := $(TARGET_OUT_KEYLAYOUT)/surf_keypad.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/surf_keypad.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/7k_handset.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/7k_handset.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/7x27a_kp.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/7x27a_kp.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/etc/vold.fstab
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/vold.fstab | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.target.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.target.rc | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/etc/init.qcom.composition_type.sh
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.qcom.composition_type.sh | $(ACP)
	$(transform-prebuilt-to-target)

ifeq ($(strip $(BOARD_HAS_QCOM_WLAN)),true)
file := $(TARGET_OUT)/etc/wifi/wpa_supplicant.conf
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/wpa_supplicant.conf | $(ACP)
	$(transform-prebuilt-to-target)
endif
#----------------------------------------------------------------------
# Radio image
#----------------------------------------------------------------------
ifeq ($(ADD_RADIO_FILES), true)
radio_dir := $(LOCAL_PATH)/radio
RADIO_FILES := $(shell cd $(radio_dir) ; find . -iname '*.ENC')
$(foreach f, $(RADIO_FILES), \
    $(call add-radio-file,radio/$(f)))
endif
