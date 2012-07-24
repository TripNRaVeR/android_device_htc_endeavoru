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
USE_CAMERA_STUB := true

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
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
#ARCH_ARM_USE_NON_NEON_MEMCPY := true

# Architecture - Tegra
TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t30

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_EXTRA_CFLAGS += $(call cc-option, -mtune=cortex-a9)

# ICS drivers
COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB -DICS_CAMERA_BLOB

# Audio
BOARD_USES_AUDIO_LEGACY := true
BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_ALSA_AUDIO := true
#BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true
#TARGET_PROVIDES_LIBAUDIO := true

# Misc settings
BOARD_USE_SKIA_LCDTEXT := true
#NEED_WORKAROUND_CORTEX_A9_745320 := true
BOARD_SKIP_ANDROID_DOC_BUILD := true
TARGET_BOOTANIMATION_PRELOAD := true
BOARD_NEEDS_MEMORYHEAPPMEM := true

# set value below to true when using tripndroid 3.1.10 kernel
BOARD_USES_GENERIC_INVENSENSE := false

# WebKit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true
WEBCORE_ACCELERATED_SCROLLING := true

# Graphics
BOARD_EGL_CFG := device/htc/endeavoru/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_USES_OVERLAY := true
BOARD_USES_HWCOMPOSER := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true

# Connectivity - Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Connectivity - RIL
BOARD_FORCE_RILD_AS_ROOT := true
BOARD_USE_NEW_LIBRIL_HTC := true
TARGET_PROVIDES_LIBRIL := vendor/htc/endeavoru/proprietary/lib/libhtc-ril.so
#BOARD_USE_KINETO_COMPATIBILITY := true

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := wl12xx_mac80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_SOFTAP_DEVICE_TI := NL80211
BOARD_P2P_DEVICE_TI := NL80211
WIFI_DRIVER_MODULE_NAME	:=  "wl12xx_sdio"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wl12xx_sdio.ko"
COMMON_GLOBAL_CFLAGS += -DUSES_TI_MAC80211

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Endeavor partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2302672896
BOARD_FLASH_BLOCK_SIZE := 4096

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun0/file"
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 20
BOARD_HAS_SDCARD_INTERNAL := true

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/htc/endeavoru
TARGET_KERNEL_CONFIG := tripndroid_jb_defconfig
#
TARGET_PREBUILT_KERNEL := device/htc/endeavoru/prebuilt/kernel
