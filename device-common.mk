#
# Copyright (C) 2018 The LineageOS Project
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


DEVICE_PATH := device/samsung/ha3g-common

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    device/samsung/ha3g-common/overlay/lineage-sdk \
    device/samsung/ha3g-common/overlay/hardware/samsung/AdvancedDisplay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Ramdisk
PRODUCT_PACKAGES += \
    init.target.rc

# AdvancedDisplay (MDNIE)
PRODUCT_PACKAGES += \
    AdvancedDisplay 

# Bluetooth
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/bluetooth/bt_vendor.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/bluetooth/bt_vendor.conf

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/e2fsck:$(TARGET_COPY_OUT_SYSTEM)/bin/e2fsck



# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/ysound.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/ysound.xml \
    $(DEVICE_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects.conf \
    $(DEVICE_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy.conf \
    $(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/mixer_paths.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Key-layout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/idc/sec_e-pen.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/sec_e-pen.idc \
    $(DEVICE_PATH)/configs/idc/Synaptics_HID_TouchPad.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/Synaptics_HID_TouchPad.idc \
    $(DEVICE_PATH)/configs/idc/Synaptics_RMI4_TouchPad_Sensor.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/Synaptics_RMI4_TouchPad_Sensor.idc \
    $(DEVICE_PATH)/configs/keylayout/Button_Jack.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Button_Jack.kl \
    $(DEVICE_PATH)/configs/keylayout/gpio_keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio_keys.kl \
    $(DEVICE_PATH)/configs/keylayout/sec_e-pen.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_e-pen.kl \
    $(DEVICE_PATH)/configs/keylayout/sec_touchscreen.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchscreen.kl

# Properties
-include $(LOCAL_PATH)/system_prop.mk

# Shims
PRODUCT_PACKAGES += \
libshim_dmitry_gps \
    libshim_atomic \
    libcutils_shim \
    libshim_binder
    
 # Macloader
 PRODUCT_PACKAGES += \
     macloader
 
# SamsungDoze
PRODUCT_PACKAGES += \
    SamsungDoze 
     
# GPS
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/gps/gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gps.xml \
    $(DEVICE_PATH)/configs/gps/gps.cer:$(TARGET_COPY_OUT_VENDOR)/bin/gps.cer     
        

 # Camera
 PRODUCT_PACKAGES += \
     libhwjpeg \
     libsecnativefeature 

# Lights
PRODUCT_PACKAGES += \
    lights.universal5420
     
# libstlport
 PRODUCT_PACKAGES += \
     libstlport     

# Shipping API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_k.mk)

# Inherit from universal5420-common
$(call inherit-product, device/samsung/universal5420-common/device-common.mk)

# call the proprietary setup
$(call inherit-product, vendor/samsung/ha3g-common/ha3g-common-vendor.mk)
