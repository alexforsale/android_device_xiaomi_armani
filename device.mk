#
# Copyright (C) 2015 The Android Open Source Project
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
$(call inherit-product, device/qcom/msm8226/msm8226.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/dt.img:dt.img
    
# Prebuilt
#PRODUCT_COPY_FILES += \
#    $(call find-copy-subdir-files,*,device/xiaomi/armani/prebuilt,system)

# Rootdir
#PRODUCT_COPY_FILES += \
#    $(call find-copy-subdir-files,*,device/xiaomi/armani/rootdir,root)

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8226

# Power
PRODUCT_PACKAGES += \
    power.msm8226

# GPS
PRODUCT_PACKAGES += \
    gps.msm8226

# Display
PRODUCT_PACKAGES += \
    memtrack.msm8226 \

# Audio
PRODUCT_PACKAGES += \
    audio.r_submix.default

PRODUCT_PACKAGES += \
    tinymix

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_PACKAGES += \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    wcnss_service

# Default props
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Call the proprietary setup
$(call inherit-product-if-exist, vendor/xiaomi/armani/armani-vendor.mk)
