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

# Inherit from universal5420-common
include device/samsung/universal5420-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/ha3g-common

# Include path
TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Display
TARGET_SCREEN_DENSITY := 480

#Additional Sepolicy (Camera and YMU831 Chip Required)
BOARD_SEPOLICY_DIRS += device/samsung/ha3g-common/sepolicy

# Camera: portrait orientation
BOARD_CAMERA_FRONT_ROTATION := 270
BOARD_CAMERA_BACK_ROTATION := 90
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
BOARD_NEEDS_MEMORYHEAPION := true
BOARD_GLOBAL_CFLAGS += -DSAMSUNG_DVFS

# Mixer
BOARD_USE_BGRA_8888 := true

# HDMI
BOARD_USES_GSC_VIDEO := true

# Battery
RED_LED_PATH := "/sys/class/leds/led_r/brightness" 
GREEN_LED_PATH := "/sys/class/leds/led_g/brightness" 
BLUE_LED_PATH := "/sys/class/leds/led_b/brightness" 
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"

# Audio blobs
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

#Yamaha Audio-Hal
TARGET_AUDIOHAL_VARIANT := yamaha

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/bin/gpsd|/vendor/lib/libshim_dmitry_gps.so \
   /system/vendor/lib/libsec-ril.so|libshim_atomic.so \
   /system/vendor/lib/libsec-ril.so|/vendor/lib/libcutils_shim.so

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
BOARD_GLOBAL_CFLAGS += -DSEC_PRODUCT_FEATURE_RIL_CALL_DUALMODE_CDMAGSM

# Inherit from the proprietary version
-include vendor/samsung/ha3g-common/BoardConfigVendor.mk
