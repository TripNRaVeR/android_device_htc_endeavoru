# Device stuff
$(call inherit-product, device/htc/endeavoru/device_endeavoru.mk)


# Release name
PRODUCT_RELEASE_NAME := endeavoru

# Inherit some common stuff.
$(call inherit-product, vendor/tripndroid/config/common_full_phone.mk)
# Inherit gsm stuff
$(call inherit-product, vendor/tripndroid/config/gsm.mk)
# Enhanced NFC
$(call inherit-product, vendor/tripndroid/config/nfc_enhanced.mk)

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-720x1280
TARGET_BOOTANIMATION_PRELOAD := true

# screen info
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

#
# Setup device specific product configuration.
#
PRODUCT_NAME := tripndroid_endeavoru
PRODUCT_BRAND := htc_europe
PRODUCT_DEVICE := endeavoru
PRODUCT_MODEL := HTC One X
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=endeavoru BUILD_FINGERPRINT="htc_europe/endeavoru/endeavoru:4.1.1/JRO03C/128187.31:user/release-keys" PRIVATE_BUILD_DESC="3.14.401.31 CL128187 release-keys"
