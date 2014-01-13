#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
-include vendor/zte/atlas40/BoardConfigVendor.mk

# Platform
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a5
TARGET_ARCH_VARIANT := armv7-a-neon

ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp

# Kernel
TARGET_KERNEL_SOURCE := kernel/zte/msm7x27a
TARGET_KERNEL_CONFIG := cyanogen_atlas40_defconfig
TARGET_BOOTLOADER_BOARD_NAME := atlas40
BOARD_KERNEL_CMDLINE := androidboot.hardware=atlas40
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096

TARGET_SPECIFIC_HEADER_PATH := device/zte/atlas40/include

# Graphics
BOARD_EGL_CFG := device/zte/atlas40/prebuilt/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_USE_MHEAP_SCREENSHOT := true

# Video
TARGET_QCOM_LEGACY_OMX := true
TARGET_QCOM_MEDIA_VARIANT := legacy
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK

# Qualcomm hardware
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Wi-Fi
BOARD_WLAN_DEVICE := ath6kl
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_ath6kl
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_MODULE_PATH := "/system/wifi/ath6kl_sdio.ko"
WIFI_DRIVER_MODULE_NAME := "ath6kl_sdio"
WIFI_EXT_MODULE_PATH := "/system/wifi/cfg80211.ko"
WIFI_EXT_MODULE_NAME := "cfg80211"
WIFI_TEST_INTERFACE := "sta"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"

# Audio
TARGET_PROVIDES_LIBAUDIO := true
TARGET_QCOM_AUDIO_VARIANT := legacy
BOARD_USES_LEGACY_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/atlas40/bluetooth

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DNEEDS_VECTORIMPL_SYMBOLS -DZTE_CAMERA_HARDWARE

# Dalvik
TARGET_ARCH_LOWMEM := true

# FM Radio
BOARD_HAVE_QCOM_FM := true
COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := atlas40
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Webkit
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
TARGET_FORCE_CPU_UPLOAD := true

# Hardware tunables framework
BOARD_HARDWARE_CLASS := device/zte/atlas40/cmhw/

# Recovery
TARGET_RECOVERY_FSTAB := device/zte/atlas40/ramdisk/fstab.atlas40
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_UMS_LUNFILE := "sys/class/android_usb/f_mass_storage/lun/file"
TARGET_USERIMAGES_USE_EXT4 := true
COMMON_GLOBAL_CFLAGS += -DRECOVERY_CANT_USE_CONFIG_EXT4_FS_XATTR
SKIP_SET_METADATA := true

# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 419430400
BOARD_CACHEIMAGE_PARTITION_SIZE := 314572800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2684354560
BOARD_FLASH_BLOCK_SIZE := 131072
