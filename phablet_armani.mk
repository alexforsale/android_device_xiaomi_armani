# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/xiaomi/armani/device.mk)
$(call inherit-product-if-exists, vendor/xiaomi/armani/armani-vendor.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_DEVICE := armani
PRODUCT_NAME := phablet_armani
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := HM 1S
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=armani

# Ubuntu Overlay Files
PRODUCT_COPY_FILES += \
    device/xiaomi/armani/ubuntu/udev.rules:system/ubuntu/lib/udev/rules.d/70-android.rules \
    device/xiaomi/armani/ubuntu/display.conf:system/ubuntu/etc/ubuntu-touch-session.d/android.conf \
    device/xiaomi/armani/ubuntu/apparmor_audio:system/ubuntu/usr/share/apparmor/hardware/audio.d/apparmor-easyprof-ubuntu_android \
    device/xiaomi/armani/ubuntu/apparmor_graphics:system/ubuntu/usr/share/apparmor/hardware/graphics.d/apparmor-easyprof-ubuntu_android \
    device/xiaomi/armani/ubuntu/apparmor_video:system/ubuntu/usr/share/apparmor/hardware/video.d/apparmor-easyprof-ubuntu_android \
    device/xiaomi/armani/ubuntu/rcS:system/ubuntu/etc/default/hwclock

