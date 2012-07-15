# Copyright (C) 2011 The Android Open Source Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/endeavoru/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# These are the hardware-specific features
PRODUCT_COPY_FILES := \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Prebuilt kernel location
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/endeavoru/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Files needed for boot image
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/ramdisk/init:root/init \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
    $(LOCAL_PATH)/ramdisk/init.endeavoru.rc:root/init.endeavoru.rc \
    $(LOCAL_PATH)/ramdisk/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.endeavoru.rc:root/ueventd.endeavoru.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.rc

# Sound
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/CodecDSPID.txt:system/etc/soundimage/CodecDSPID.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/CodecDSPID_XC.txt:system/etc/soundimage/CodecDSPID_XC.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_BT_CarMode.txt:system/etc/soundimage/Sound_BT_CarMode.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_FM_HP.txt:system/etc/soundimage/Sound_FM_HP.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_FM_SPK.txt:system/etc/soundimage/Sound_FM_SPK.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_FM_SPK_XC.txt:system/etc/soundimage/Sound_FM_SPK_XC.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Note_Recording.txt:system/etc/soundimage/Sound_Note_Recording.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Original_DOCK.txt:system/etc/soundimage/Sound_Original_DOCK.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Original_SPK_RING.txt:system/etc/soundimage/Sound_Original_SPK_RING.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Original_SPK_XC.txt:system/etc/soundimage/Sound_Original_SPK_XC.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Original_HP.txt:system/etc/soundimage/Sound_Original_HP.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Phone_Original_BT.txt:system/etc/soundimage/Sound_Phone_Original_BT.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Phone_Original_DOCK.txt:system/etc/soundimage/Sound_Phone_Original_DOCK.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_SpeakerVR_Recording.txt:system/etc/soundimage/Sound_SpeakerVR_Recording.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Voice_Recording_AMR.txt:system/etc/soundimage/Sound_Voice_Recording_AMR.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Voip_Original_BT.txt:system/etc/soundimage/Sound_Voip_Original_BT.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Voip_Original_HP.txt:system/etc/soundimage/Sound_Voip_Original_HP.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Voip_Original_REC.txt:system/etc/soundimage/Sound_Voip_Original_REC.txt \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/Sound_Voip_Original_SPK.txt:system/etc/soundimage/Sound_Voip_Original_SPK.txt \
    $(LOCAL_PATH)/prebuilt/etc/AIC3008_REG_DualMic.csv:system/etc/AIC3008_REG_DualMic.csv \
    $(LOCAL_PATH)/prebuilt/etc/AIC3008_REG_DualMic_XC.csv:system/etc/AIC3008_REG_DualMic_XC.csv \
    $(LOCAL_PATH)/prebuilt/etc/asound.conf:system/etc/asound.conf

# Sound alsa config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/alsa.conf:system/usr/share/alsa/alsa.conf

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
	system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Media profiles
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/gps/agps.truststore:system/etc/gps/agps.truststore \
    $(LOCAL_PATH)/prebuilt/etc/gps/agps.truststore_lab:system/etc/gps/agps.truststore_lab \
    $(LOCAL_PATH)/prebuilt/etc/gps/tigpsrouter:system/etc/gps/tigpsrouter \
    $(LOCAL_PATH)/prebuilt/etc/gps/RXN/license.key:system/etc/gps/RXN/license.key \
    $(LOCAL_PATH)/prebuilt/etc/gps/RXN/MSLConfig.txt:system/etc/gps/RXN/MSLConfig.txt \
    $(LOCAL_PATH)/prebuilt/etc/gps/RXN/security.key:system/etc/gps/RXN/security.key \
    $(LOCAL_PATH)/prebuilt/etc/pathconfigfile.txt:system/etc/pathconfigfile.txt

# Input files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    $(LOCAL_PATH)/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    $(LOCAL_PATH)/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    $(LOCAL_PATH)/idc/tv-touchscreen.idc:system/usr/idc/tv-touchscreen.idc \
    $(LOCAL_PATH)/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    $(LOCAL_PATH)/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl

# Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/nvram_4329.txt:system/etc/nvram_4329.txt \
    $(LOCAL_PATH)/prebuilt/etc/nvram_4330.txt:system/etc/nvram_4330.txt \
    $(LOCAL_PATH)/prebuilt/etc/nvcamera.conf:system/etc/nvcamera.conf \
    $(LOCAL_PATH)/prebuilt/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    $(LOCAL_PATH)/prebuilt/firmware/fmc_init_1283.1.bts:system/etc/firmware/fmc_init_1283.1.bts \
    $(LOCAL_PATH)/prebuilt/firmware/fmc_init_1283.2.bts:system/etc/firmware/fmc_init_1283.2.bts \
    $(LOCAL_PATH)/prebuilt/firmware/fm_rx_init_1283.1.bts:system/etc/firmware/fm_rx_init_1283.1.bts \
    $(LOCAL_PATH)/prebuilt/firmware/fm_rx_init_1283.2.bts:system/etc/firmware/fm_rx_init_1283.2.bts \
    $(LOCAL_PATH)/prebuilt/firmware/nvavp_os_0ff00000.bin:system/etc/firmware/nvavp_os_0ff00000.bin \
    $(LOCAL_PATH)/prebuilt/firmware/nvavp_os_00001000.bin:system/etc/firmware/nvavp_os_00001000.bin \
    $(LOCAL_PATH)/prebuilt/firmware/nvavp_os_e0000000.bin:system/etc/firmware/nvavp_os_e0000000.bin \
    $(LOCAL_PATH)/prebuilt/firmware/nvavp_os_eff00000.bin:system/etc/firmware/nvavp_os_eff00000.bin \
    $(LOCAL_PATH)/prebuilt/firmware/nvrm_avp_0ff00000.bin:system/etc/firmware/nvrm_avp_0ff00000.bin \
    $(LOCAL_PATH)/prebuilt/firmware/nvrm_avp_8e000000.bin:system/etc/firmware/nvrm_avp_8e000000.bin \
    $(LOCAL_PATH)/prebuilt/firmware/nvrm_avp_9e000000.bin:system/etc/firmware/nvrm_avp_9e000000.bin \
    $(LOCAL_PATH)/prebuilt/firmware/nvrm_avp_00001000.bin:system/etc/firmware/nvrm_avp_00001000.bin \
    $(LOCAL_PATH)/prebuilt/firmware/nvrm_avp_be000000.bin:system/etc/firmware/nvrm_avp_be000000.bin \
    $(LOCAL_PATH)/prebuilt/firmware/nvrm_avp_e0000000.bin:system/etc/firmware/nvrm_avp_e0000000.bin \
    $(LOCAL_PATH)/prebuilt/firmware/nvrm_avp_eff00000.bin:system/etc/firmware/nvrm_avp_eff00000.bin \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_aacdec.axf:/system/etc/firmware/nvmm_aacdec.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_adtsdec.axf:/system/etc/firmware/nvmm_adtsdec.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_h264dec.axf:/system/etc/firmware/nvmm_h264dec.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_jpegdec.axf:/system/etc/firmware/nvmm_jpegdec.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_jpegenc.axf:/system/etc/firmware/nvmm_jpegenc.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_manager.axf:/system/etc/firmware/nvmm_manager.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_mp3dec.axf:/system/etc/firmware/nvmm_mp3dec.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_mpeg4dec.axf:/system/etc/firmware/nvmm_mpeg4dec.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_reference.axf:/system/etc/firmware/nvmm_reference.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_service.axf:/system/etc/firmware/nvmm_service.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_sorensondec.axf:/system/etc/firmware/nvmm_sorensondec.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_vc1dec.axf:/system/etc/firmware/nvmm_vc1dec.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_wavdec.axf:/system/etc/firmware/nvmm_wavdec.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_wmadec.axf:/system/etc/firmware/nvmm_wmadec.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_wmaprodec.axf:/system/etc/firmware/nvmm_wmaprodec.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_h264dec2x.axf:/system/etc/firmware/nvmm_h264dec2x.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_vc1dec_2x.axf:/system/etc/firmware/nvmm_vc1dec_2x.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvmm_mpeg2dec.axf:/system/etc/firmware/nvmm_mpeg2dec.axf \
    $(LOCAL_PATH)/prebuilt/firmware/nvavp_vid_ucode.bin:/system/etc/firmware/nvavp_vid_ucode.bin \
    $(LOCAL_PATH)/prebuilt/firmware/nvavp_vid_ucode_alt.bin:/system/etc/firmware/nvavp_vid_ucode_alt.bin \
    $(LOCAL_PATH)/prebuilt/firmware/TIInit_10.4.27.bts:system/etc/firmware/TIInit_10.4.27.bts \
    $(LOCAL_PATH)/prebuilt/firmware/TIInit_10.5.20.bts:system/etc/firmware/TIInit_10.5.20.bts \
    $(LOCAL_PATH)/prebuilt/firmware/TIInit_10.6.15.bts:system/etc/firmware/TIInit_10.6.15.bts \
    $(LOCAL_PATH)/prebuilt/firmware/WL128x_2.21_1.1.bts:system/etc/firmware/WL128x_2.21_1.1.bts \
    $(LOCAL_PATH)/prebuilt/firmware/ti-connectivity/wl128x-fw-4-mr.bin:system/etc/firmware/ti-connectivity/wl128x-fw-4-mr.bin \
    $(LOCAL_PATH)/prebuilt/firmware/ti-connectivity/wl128x-fw-4-sr.bin:system/etc/firmware/ti-connectivity/wl128x-fw-4-sr.bin \
    $(LOCAL_PATH)/prebuilt/firmware/ti-connectivity/wl128x-fw-mr.bin.r4:system/etc/firmware/ti-connectivity/wl128x-fw-mr.bin.r4 \
    $(LOCAL_PATH)/prebuilt/firmware/ti-connectivity/wl128x-fw-mr.bin.r5:system/etc/firmware/ti-connectivity/wl128x-fw-mr.bin.r5 \
    $(LOCAL_PATH)/prebuilt/firmware/ti-connectivity/wl1271-nvs.bin:system/etc/firmware/ti-connectivity/wl1271-nvs.bin

# Hotspot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    $(LOCAL_PATH)/prebuilt/etc/wifi/TQS_D_1.7.ini:system/etc/wifi/TQS_D_1.7.ini

# Ril
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/Flash_Loader.conf:system/etc/Flash_Loader.conf \
    $(LOCAL_PATH)/prebuilt/etc/QUO_6260.fls.clean:system/etc/QUO_6260.fls.clean

# Modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/modules/baseband_usb_chr.ko:system/lib/modules/baseband_usb_chr.ko \
    $(LOCAL_PATH)/prebuilt/modules/baseband-xmm-power2.ko:system/lib/modules/baseband-xmm-power2.ko \
    $(LOCAL_PATH)/prebuilt/modules/btwilink.ko:system/lib/modules/btwilink.ko \
    $(LOCAL_PATH)/prebuilt/modules/cavm_sqos_mod.ko:system/lib/modules/cavm_sqos_mod.ko \
    $(LOCAL_PATH)/prebuilt/modules/cdc-acm.ko:system/lib/modules/cdc-acm.ko \
    $(LOCAL_PATH)/prebuilt/modules/cfg80211.ko:system/lib/modules/cfg80211.ko \
    $(LOCAL_PATH)/prebuilt/modules/cifs.ko:system/lib/modules/cifs.ko \
    $(LOCAL_PATH)/prebuilt/modules/compat.ko:system/lib/modules/compat.ko \
    $(LOCAL_PATH)/prebuilt/modules/fm_drv.ko:system/lib/modules/fm_drv.ko \
    $(LOCAL_PATH)/prebuilt/modules/gps_drv.ko:system/lib/modules/gps_drv.ko \
    $(LOCAL_PATH)/prebuilt/modules/htc_sqos_ctrlmsg.ko:system/lib/modules/htc_sqos_ctrlmsg.ko \
    $(LOCAL_PATH)/prebuilt/modules/htc_sqos_encoder.ko:system/lib/modules/htc_sqos_encoder.ko \
    $(LOCAL_PATH)/prebuilt/modules/htc_sqos_wifi.ko:system/lib/modules/htc_sqos_wifi.ko \
    $(LOCAL_PATH)/prebuilt/modules/lib80211.ko:system/lib/modules/lib80211.ko \
    $(LOCAL_PATH)/prebuilt/modules/mac80211.ko:system/lib/modules/mac80211.ko \
    $(LOCAL_PATH)/prebuilt/modules/nls_utf8.ko:system/lib/modules/nls_utf8.ko \
    $(LOCAL_PATH)/prebuilt/modules/raw_ip_net.ko:system/lib/modules/raw_ip_net.ko \
    $(LOCAL_PATH)/prebuilt/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    $(LOCAL_PATH)/prebuilt/modules/st_drv.ko:system/lib/modules/st_drv.ko \
    $(LOCAL_PATH)/prebuilt/modules/tcrypt.ko:system/lib/modules/tcrypt.ko \
    $(LOCAL_PATH)/prebuilt/modules/ti_hci_drv.ko:system/lib/modules/ti_hci_drv.ko \
    $(LOCAL_PATH)/prebuilt/modules/wl12xx.ko:system/lib/modules/wl12xx.ko \
    $(LOCAL_PATH)/prebuilt/modules/wl12xx_sdio.ko:system/lib/modules/wl12xx_sdio.ko

# Misc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/prebuilt/su:system/xbin/su \
    $(LOCAL_PATH)/prebuilt/hosts:system/etc/hosts

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# NFC
PRODUCT_PACKAGES += \
        libnfc \
        libnfc_jni \
        Nfc \
        Tag

# file that declares the MIFARE NFC constant
PRODUCT_COPY_FILES += \
	device/sample/nxp/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# NFC EXTRAS add-on API
PRODUCT_PACKAGES += \
	com.android.nfc_extras
PRODUCT_COPY_FILES += \
	frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/htc/endeavoru/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/htc/endeavoru/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# Build characteristics setting 
PRODUCT_CHARACTERISTICS := default

# This device have enough room for precise dalvik
PRODUCT_TAGS += dalvik.gc.type-precise

# Extra packages to build for this device
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory \
    make_ext4fs \
    setup_fs

# Hardware
PRODUCT_PACKAGES += \
    lights.endeavoru

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaudioutils \
    libtinyalsa

# Hostapd / TI fm
PRODUCT_PACKAGES += \
         hostapd_cli \
         calibrator \
         hostapd

# Propertys specific for this device
PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=240 \
    ro.opengles.version=131072 \
    dalvik.vm.dexopt-data-only=1

# Tegra 3 specific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.nvmmlite=1

# Inherit phone dalvik settings
$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)

# Call the vendor to setup propiatory files
$(call inherit-product-if-exists, vendor/htc/endeavoru/endeavoru-vendor.mk)

# Device nameing
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_endeavoru
PRODUCT_DEVICE := endeavoru
PRODUCT_MODEL := HTC One X
PRODUCT_BRAND := htc_europe
PRODUCT_MANUFACTURER := HTC
