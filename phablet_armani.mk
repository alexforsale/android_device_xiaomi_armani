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
    device/xiaomi/armani/ubuntu/udev.rules:system/ubuntu/lib/udev/rules.d/70-armani.rules \
    device/xiaomi/armani/ubuntu/display.conf:system/ubuntu/etc/ubuntu-touch-session.d/armani.conf \
    device/xiaomi/armani/ubuntu/apparmor_audio:system/ubuntu/usr/share/apparmor/hardware/audio.d/apparmor-easyprof-ubuntu_armani \
    device/xiaomi/armani/ubuntu/apparmor_graphics:system/ubuntu/usr/share/apparmor/hardware/graphics.d/apparmor-easyprof-ubuntu_armani \
    device/xiaomi/armani/ubuntu/apparmor_video:system/ubuntu/usr/share/apparmor/hardware/video.d/apparmor-easyprof-ubuntu_armani \
    device/xiaomi/armani/ubuntu/rcS:system/ubuntu/etc/default/hwclock \
    device/xiaomi/armani/ubuntu/bluetooth-touch-armani.conf:system/ubuntu/etc/init/bluetooth-touch-armani.conf \
    device/xiaomi/armani/ubuntu/bluetooth.sh:system/ubuntu/usr/share/bluetooth-touch/armani \
    device/xiaomi/armani/ubuntu/config-armani.xml:system/ubuntu/usr/share/powerd/device_configs/config-armani.xml \
    device/xiaomi/armani/ubuntu/init/ubuntu-location-service.override:system/ubuntu/etc/init/ubuntu-location-service.override \
    device/xiaomi/armani/ubuntu/msm8226-tapan-snd-card.conf:system/ubuntu/usr/share/alsa/ucm/msm8226-tapan-snd-card/msm8226-tapan-snd-card.conf \
    device/xiaomi/armani/ubuntu/HiFi:system/ubuntu/usr/share/alsa/ucm/msm8226-tapan-snd-card/HiFi \
    device/xiaomi/armani/ubuntu/VoiceCall:system/ubuntu/usr/share/alsa/ucm/msm8226-tapan-snd-card/VoiceCall

# device id for ubuntu initrd
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=armani

# not automatically compiled by the build process
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegvdec \
    libstagefright_soft_ffmpegadec
