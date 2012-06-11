# Copyright (C) 2011 The Android Open Source Project
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

# A few more packages that aren't quite used on all builds
PRODUCT_PACKAGES := \
	LiveWallpapersPicker

# Camera
PRODUCT_PACKAGES += \
    Camera

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from toro device
$(call inherit-product, device/htc/endeavoru/device_endeavoru.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_endeavoru
PRODUCT_DEVICE := endeavoru
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC One X
