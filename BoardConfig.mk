#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/htc/endeavoru/BoardConfigVendor.mk

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Board settings
TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := tegra
TARGET_BOOTLOADER_BOARD_NAME := endeavoru

# Boot settings
BOARD_KERNEL_CMDLINE := tegraid=30.1.3.0.0 mem=1016M@2048M vmalloc=668M video=tegrafb
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 4096

# Audio
BOARD_USES_GENERIC_AUDIO := false
#BOARD_USES_AUDIO_LEGACY := true
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_NEON := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_EXTRA_CFLAGS += $(call cc-option, -mtune=cortex-a9)

COMMON_GLOBAL_CFLAGS += -DSCREEN_RELEASE -DPOS_HTC_CAMERA
#COMMON_GLOBAL_CFLAGS += -DSURFACEFLINGER_FORCE_SCREEN_RELEASE -DPOS_HTC_CAMERA

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_HAVE_FM_RADIO_TI := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# Hardware
BOARD_HAVE_GPS := true

# EGL settings
BOARD_EGL_CFG := device/htc/endeavoru/prebuilt/egl.cfg
TARGET_USES_GL_VENDOR_EXTENSIONS := true
USE_OPENGL_RENDERER := true

# Graphics
BOARD_USES_HGL := true
BOARD_USES_OVERLAY := true
BOARD_USES_HWCOMPOSER := true
#TARGET_GRALLOC_USES_ASHMEM := true

# GPS
BOARD_HAVE_GPS_BCM := true

# Misc settings
BOARD_USE_SKIA_LCDTEXT := true
BOARD_USES_SECURE_SERVICES := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true

# Connectivity - Bluetooth
BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_BCM := true

# Connectivity - RIL
BOARD_USE_NEW_LIBRIL_HTC := true
BOARD_USE_KINETO_COMPATIBILITY := true

# Connectivity - Wi-Fi
BOARD_WLAN_DEVICE                := wl12xx_mac80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_BAND 			 := 802_11_ABGN
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_wl12xx
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wl12xx_sdio.ko"
WIFI_DRIVER_MODULE_NAME          := "wl12xx_sdio"
COMMON_GLOBAL_CFLAGS += -DUSES_TI_MAC80211

# Endeavor partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2302672896
BOARD_FLASH_BLOCK_SIZE := 4096

# prebuilt Kernel
TARGET_PREBUILT_KERNEL := device/htc/endeavoru/kernel

# Recovery Options
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := false
BOARD_USES_MMCUTILS := true

# Webkit
TARGET_FORCE_CPU_UPLOAD := true
WEBCORE_ACCELERATED_SCROLLING := true

# Test
PROTEUS_DEVICE_API := true
BOARD_HAVE_HTC_FFC := true
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun0/file"
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 20
BOARD_HAS_SDCARD_INTERNAL := true

