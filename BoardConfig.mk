#
# Copyright (C) 2014 The CyanogenMod Project
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

# inherit from Oppo common
-include device/oppo/common/BoardConfigCommon.mk

# Inherit from CM directly
-include vendor/cm/BoardConfig.mk


# SELinux
-include device/qcom/sepolicy/sepolicy.mk




PLATFORM_PATH := device/oneplus/onyx

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(PLATFORM_PATH)/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Assertions
TARGET_BOARD_INFO_FILE ?= $(PLATFORM_PATH)/board-info.txt

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x3b7 ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 01000000 --tags_offset 00000100
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 01000000 --tags_offset 00000100 --dt $(PLATFORM_PATH)/dt.img
#TARGET_CUSTOM_DTBTOOL := dtbToolONYX
TARGET_CUSTOM_DTBTOOL := dtbToolCM
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_CONFIG := opx_defconfig
TARGET_KERNEL_SOURCE := kernel/oneplus/onyx

# Enable DIAG on debug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
TARGET_KERNEL_ADDITIONAL_CONFIG:= cyanogenmod_debug_config
endif

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Assert
TARGET_OTA_ASSERT_DEVICE := ONE

# Audio
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_FM := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
TARGET_QCOM_NO_FM_FIRMWARE := true


# Bluetooth
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_SMD_TTY := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CM Hardware
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += $(PLATFORM_PATH)/cmhw

# Enable dexpreopt to speed boot time
ifeq ($(HOST_OS),linux)
  ifeq ($(call match-word-in-list,$(TARGET_BUILD_VARIANT),user),true)
    ifeq ($(WITH_DEXPREOPT_BOOT_IMG_ONLY),)
      WITH_DEXPREOPT_BOOT_IMG_ONLY := true
    endif
  endif
endif

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE    := 536870912
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1388314624
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13271448576
BOARD_USERDATAEXTRAIMAGE_PARTITION_SIZE := 59914792960
BOARD_USERDATAEXTRAIMAGE_PARTITION_NAME := 64G
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for factory issue
BOARD_VOLD_CRYPTFS_MIGRATE := true

# Flags
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
COMMON_GLOBAL_CPPFLAGS += -DNO_SECURE_DISCARD

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# GPS
TARGET_GPS_HAL_PATH := $(PLATFORM_PATH)/gps
TARGET_PROVIDES_GPS_LOC_API := true

# Graphics
HAVE_ADRENO_SOURCE := false
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := $(PLATFORM_PATH)/init/init_onyx.c
TARGET_UNIFIED_DEVICE := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Protobuf-c
PROTOBUF_SUPPORTED := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Radio
TARGET_RIL_VARIANT := caf

#Preload Libs
TARGET_LDPRELOAD := libNimsWrap.so

# Recovery
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.qcom

# RPC
TARGET_NO_RPC := true

BOARD_SEPOLICY_DIRS += \
    $(PLATFORM_PATH)/sepolicy

BOARD_SEPOLICY_UNION += \
    bootanim.te \
    device.te \
    file.te \
    file_contexts \
    genfs_contexts \
    healthd.te \
    mediaserver.te \
    property.te \
    property_contexts \
    radio.te \
    rmt_storage.te \
    servicemanager.te \
    shell.te \
    system_app.te \
    system_server.te \
    tee.te \
    thermal-engine.te \
    ueventd.te \
    vold.te \
    wcnss_service.te \
    zygote.te

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
TARGET_USES_WCNSS_CTRL           := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_MAC_ADDR_REV   := true
TARGET_WCNSS_MAC_PREFIX          := e8bba8
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WPA_SUPPLICANT_VERSION           := VER_0_8_X

# inherit from the proprietary version
ifneq ($(QCPATH),)
-include $(QCPATH)/common/msm8974/BoardConfigVendor.mk
endif

-include vendor/oneplus/onyx/BoardConfigVendor.mk
