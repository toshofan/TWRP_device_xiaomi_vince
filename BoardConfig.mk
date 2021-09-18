#
# Copyright (C) 2020 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/vince

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := vince

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8953
TARGET_NO_BOOTLOADER := true

# Crypto
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE := true

# File systems
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Init
TARGET_INIT_VENDOR_LIB := libinit_vince
TARGET_RECOVERY_DEVICE_MODULES := libinit_vince

# Kernel
BOARD_KERNEL_CMDLINE := \
    ignore_loglevel \
    console=ttyHSL0,115200,n8 \
    androidboot.console=ttyHSL0 \
    androidboot.hardware=qcom msm_rtb.filter=0x237 \
    ehci-hcd.park=3 \
    lpm_levels.sleep_disabled=1 \
    androidboot.bootdevice=7824900.sdhci \
    earlycon=msm_hsl_uart,0x78af000 \
    audit=0 \
    androidboot.selinux=permissive

BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_PREBUILT_KERNEL := device/xiaomi/vince/prebuilt/Image.gz-dtb

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25765043200 # (25765060096 - 16384)
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232

# Platform
TARGET_BOARD_PLATFORM := msm8953
TARGET_BOARD_PLATFORM_GPU := qcom-adreno506

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP OSS Blobs
TARGET_RECOVERY_DEVICE_MODULES += \
    libicuuc \
    libxml2 \
    libion \
    android.hidl.base@1.0

TW_RECOVERY_ADDITIONAL_RELINK_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libicuuc.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT)/lib64/android.hidl.base@1.0.so

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_USE_TOOLBOX := true
TW_INCLUDE_FUSE_EXFAT := true 
TW_INCLUDE_FUSE_NTFS := true
TW_INCLUDE_NTFS_3G := true
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_REPACKTOOLS := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_IGNORE_MISC_WIPE_DATA := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_DEFAULT_LANGUAGE := ru
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_HAS_EDL_MODE := true
TW_DEVICE_VERSION := by @Toshofan

# DNM
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# SHRP Configuration

SHRP_PATH := device/xiaomi/vince
SHRP_MAINTAINER := Toshofan
SHRP_DEVICE_CODE := vince
SHRP_EDL_MODE := 1
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb_otg
SHRP_FLASH := 1
SHRP_FONP_1 := /sys/class/leds/led:torch_0/brightness
SHRP_REC := /dev/block/bootdevice/by-name/recovery
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A_Only
SHRP_STATUSBAR_RIGHT_PADDING := 6
SHRP_STATUSBAR_LEFT_PADDING := 6
SHRP_DARK := true
SHRP_OFFICIAL := true
SHRP_EXPRESS := true
SHRP_SKIP_DEFAULT_ADDON_1 := true
SHRP_SKIP_DEFAULT_ADDON_2 := true
INC_IN_REC_ADDON_3 := true
INC_IN_REC_ADDON_4 := true
INC_IN_REC_MAGISK := true

# SHRP External Addon

SHRP_EXTERNAL_ADDON_PATH := "device/xiaomi/vince/addons/"
SHRP_EXTERNAL_ADDON_1_NAME := "Remove Google FRP"
SHRP_EXTERNAL_ADDON_1_INFO := "Removing the binding of the device to the Google account."
SHRP_EXTERNAL_ADDON_1_FILENAME := "rmfrp.zip"
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := "Install"
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := "Installed"
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true
SHRP_EXTERNAL_ADDON_2_NAME := "Fix fingerprint scanner"
SHRP_EXTERNAL_ADDON_2_INFO := "Install this if you cannot unlock your device with your fingerprint."
SHRP_EXTERNAL_ADDON_2_FILENAME := "rmfps.zip"
SHRP_EXTERNAL_ADDON_2_BTN_TEXT := "Install"
SHRP_EXTERNAL_ADDON_2_SUCCESSFUL_TEXT := "Installed"
SHRP_INC_IN_REC_EXTERNAL_ADDON_2 := true
SHRP_EXTERNAL_ADDON_3_NAME := "Delete password on boot"
SHRP_EXTERNAL_ADDON_3_INFO := "Set this if you forgot your login password."
SHRP_EXTERNAL_ADDON_3_FILENAME := "rmpass.zip"
SHRP_EXTERNAL_ADDON_3_BTN_TEXT := "Install"
SHRP_EXTERNAL_ADDON_3_SUCCESSFUL_TEXT := "Installed"
SHRP_INC_IN_REC_EXTERNAL_ADDON_3 := true
SHRP_EXTERNAL_ADDON_4_NAME := "Delete battery statistics"
SHRP_EXTERNAL_ADDON_4_INFO := "Set this if you see jumps in charge percentages."
SHRP_EXTERNAL_ADDON_4_FILENAME := "rmbat.zip"
SHRP_EXTERNAL_ADDON_4_BTN_TEXT := "Install"
SHRP_EXTERNAL_ADDON_4_SUCCESSFUL_TEXT := "Installed"
SHRP_INC_IN_REC_EXTERNAL_ADDON_4 := true
SHRP_EXTERNAL_ADDON_5_NAME := "Enable HAL3"
SHRP_EXTERNAL_ADDON_5_INFO := "Activation Camera2API."
SHRP_EXTERNAL_ADDON_5_FILENAME := "addhal3.zip"
SHRP_EXTERNAL_ADDON_5_BTN_TEXT := "Install"
SHRP_EXTERNAL_ADDON_5_SUCCESSFUL_TEXT := "Installed"
SHRP_INC_IN_REC_EXTERNAL_ADDON_5 := true
