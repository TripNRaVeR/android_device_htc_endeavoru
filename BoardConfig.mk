#
# Copyright (C) 2012 The CyanogenMod Project
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

# This needs to be defined first
USE_CAMERA_STUB := false
BOARD_SKIP_ANDROID_DOC_BUILD := true

# inherit from the proprietary version
-include vendor/htc/endeavoru/BoardConfigVendor.mk

# Bootloader
TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME :=
TARGET_PROVIDES_INIT_TARGET_RC := true
BOARD_KERNEL_PAGESIZE :=

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
# Architecture - ARM
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Architecture - Tegra
TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t30

# Erratum to avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp -ffast-math
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp -ffast-math
TARGET_EXTRA_CFLAGS += $(call cc-option, -mtune=cortex-a9 -mcpu=cortex-a9 -march=armv7-a-neon -ffast-math)

# ICS drivers
COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB -DMR0_CAMERA_BLOB -DDISABLE_HW_ID_MATCH_CHECK -D__ARM_CACHE_LINE_SIZE=32
COMMON_GLOBAL_CFLAGS += -DHTCLOG -DHTC_CAMERA_HARDWARE

# Audio
USE_PROPRIETARY_AUDIO_EXTENSIONS := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

# Camera
BOARD_USES_CAMERA_FAST_AUTOFOCUS := true
BOARD_CAMERA_HAVE_ISO := true
BOARD_HAVE_HTC_FFC := true

# Misc settings
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
BOARD_USES_SECURE_SERVICES := true
USE_IPV6_ROUTE := true

# WebKit
ENABLE_WEBGL := true

# Graphics
BOARD_EGL_CFG := device/htc/endeavoru/egl.cfg
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
BOARD_EGL_NEEDS_LEGACY_FB := true
TARGET_USES_GL_VENDOR_EXTENSIONS := true
USE_OPENGL_RENDERER := true

# Graphics - Skia
BOARD_USE_SKIA_LCDTEXT := true
BOARD_USES_SKIAHWJPEG := true

# Connectivity - Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/endeavoru/bluetooth

# Connectivity - RIL
BOARD_USE_NEW_LIBRIL_HTC := true
TARGET_PROVIDES_LIBRIL := vendor/htc/endeavoru/proprietary/lib/libhtc-ril.so

# Connectivity - Wi-Fi
WIFI_BAND 			 := 802_11_ABGN
PRODUCT_WIRELESS_TOOLS := true
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_WLAN_DEVICE                := wl12xx_mac80211
BOARD_SOFTAP_DEVICE              := wl12xx_mac80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_wl12xx
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wl12xx_sdio.ko"
WIFI_DRIVER_MODULE_NAME          := "wl12xx_sdio"
#WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlcore_sdio.ko"
#WIFI_DRIVER_MODULE_NAME          := "wlcore_sdio"
WIFI_FIRMWARE_LOADER             := ""
BOARD_LEGACY_NL80211_STA_EVENTS  := true
USES_TI_MAC80211 		 := true
COMMON_GLOBAL_CFLAGS += -DUSES_TI_MAC80211

# Sensors
#BOARD_USES_GENERIC_INVENSENSE := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USES_MMCUTILS := true

# Skip emmc wipe
BOARD_SUPPRESS_EMMC_WIPE := true

# Endeavor partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2302672896
BOARD_FLASH_BLOCK_SIZE := 4096

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file"
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 20
BOARD_SDCARD_INTERNAL_DEVICE := /dev/block/mmcblk0p14
BOARD_HAS_SDCARD_INTERNAL := true

ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/htc/endeavoru
TARGET_KERNEL_CONFIG := tripndroid_jb_defconfig
#
TARGET_PREBUILT_KERNEL := device/htc/endeavoru/prebuilt/kernel
