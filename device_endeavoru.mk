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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Call the vendor files
$(call inherit-product, vendor/htc/endeavoru/endeavoru-vendor.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += xhdpi

# Files needed for boot image
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init:root/init \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
    $(LOCAL_PATH)/ramdisk/init.endeavoru.rc:root/init.endeavoru.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.endeavoru.rc:root/ueventd.endeavoru.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/ramdisk/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/ramdisk/fstab.endeavoru:root/fstab.endeavoru

# Sound
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/alsa.conf:system/usr/share/alsa/alsa.conf \
    $(LOCAL_PATH)/prebuilt/etc/asound.conf:system/etc/asound.conf

# TripNDroid wifi firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/tripndroid/tripndroid-mr.bin:system/etc/firmware/ti-connectivity/tripndroid-mr.bin \
    $(LOCAL_PATH)/prebuilt/tripndroid/tripndroid-plt.bin:system/etc/firmware/ti-connectivity/tripndroid-plt.bin \
    $(LOCAL_PATH)/prebuilt/tripndroid/tripndroid-sr.bin:system/etc/firmware/ti-connectivity/tripndroid-sr.bin

# Wifi
PRODUCT_PACKAGES += \
	dhcpcd.conf \
	hostapd.conf \
        TQS_D_1.7.ini \
        regulatory.bin \
	calibrator

# Modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/modules/baseband-xmm-power2.ko:system/lib/modules/baseband-xmm-power2.ko \
    $(LOCAL_PATH)/prebuilt/modules/btwilink.ko:system/lib/modules/btwilink.ko \
    $(LOCAL_PATH)/prebuilt/modules/cdc-acm.ko:system/lib/modules/cdc-acm.ko \
    $(LOCAL_PATH)/prebuilt/modules/raw_ip_net.ko:system/lib/modules/raw_ip_net.ko \
    $(LOCAL_PATH)/prebuilt/modules/wl12xx.ko:system/lib/modules/wl12xx.ko \
    $(LOCAL_PATH)/prebuilt/modules/wlcore_sdio.ko:system/lib/modules/wlcore_sdio.ko

# MISC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/prebuilt/etc/nvcamera.conf:system/etc/nvcamera.conf

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/gps.conf:system/etc/gps.conf

# HW
PRODUCT_PACKAGES += \
	lights.tegra \
	camera.tegra

# Increase the HWUI font cache
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.text_cache_width=2048

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	librs_jni

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
        audio.usb.default \
	libaudioutils \
	libtinyalsa

# Enable AAC 5.1 decoder
PRODUCT_PROPERTY_OVERRIDES += \
	media.aac_51_output_enabled=true

# echo fix by pabx
PRODUCT_PACKAGES += \
	pollyd \
	Polly

# Media
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# Build some extra stuff
PRODUCT_PACKAGES += \
	static_busybox \
	make_ext4fs \
	e2fsck \
	setup_fs \
	com.android.future.usb.accessory

# Additional
PRODUCT_PACKAGES += \
	Torch \
	FileManager

# NFC
PRODUCT_PACKAGES += \
	nfc.endeavoru \
	libnfc \
	libnfc_jni \
	Nfc \
	Tag \
	com.android.nfc_extras

# NFC Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	$(LOCAL_PATH)/prebuilt/etc/nfcee_access.xml:system/etc/nfcee_access.xml

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Touchscreen
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/tv-touchscreen.idc:system/usr/idc/tv-touchscreen.idc

# Build.prop
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=240 \
	ro.opengles.version=131072 \
	dalvik.vm.dexopt-data-only=1

# Tegra specific overrides
PRODUCT_PROPERTY_OVERRIDES += \
	persist.tegra.nvmmlite=1 \
	tf.enable=n

# Build characteristics setting 
PRODUCT_CHARACTERISTICS := default

# Set non-secure
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0

# precise dalvik
PRODUCT_TAGS += dalvik.gc.type-precise

# dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Device Naming
PRODUCT_NAME := full_endeavoru
PRODUCT_DEVICE := endeavoru
PRODUCT_BRAND := htc_europe
PRODUCT_MODEL := EndeavorU

