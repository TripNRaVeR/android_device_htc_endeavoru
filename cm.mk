# Release name and versioning
PRODUCT_RELEASE_NAME := endeavoru

# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/endeavoru/device_endeavoru.mk)

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-720x1280

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_endeavoru
PRODUCT_BRAND := htc_europe
PRODUCT_DEVICE := endeavoru
PRODUCT_MODEL := HTC One X
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=endeavoru BUILD_FINGERPRINT=htc_europe/endeavoru/endeavoru:4.0.4/IMM76D/89015.5:userdebug/test-keys PRIVATE_BUILD_DESC="2.15.401.5 CL89015 test-keys"

