#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_DUP_RULES := true

BOARD_VENDOR := oneplus

VENDOR_PATH := device/oneplus/sm8150-common

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msmnile
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.selinux=permissive androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 loop.max_part=7 androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += androidboot.vbmeta.avb_version=1.0
BOARD_KERNEL_IMAGE_NAME := Image-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_RAMDISK_OFFSET := 0x02000000
TARGET_KERNEL_ADDITIONAL_FLAGS := AS=llvm-as AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := gulch_defconfig
TARGET_KERNEL_SOURCE := kernel/oneplus/sm8150

# Properties
TARGET_ODM_PROP += $(VENDOR_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(VENDOR_PATH)/product.prop
TARGET_SYSTEM_PROP += $(VENDOR_PATH)/system.prop
TARGET_VENDOR_PROP += $(VENDOR_PATH)/vendor.prop

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    system \
    vendor \
    vbmeta

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true
USE_DEVICE_SPECIFIC_CAMERA := true

# CNE and DPM
BOARD_USES_QCNE := true

# FOD
TARGET_SURFACEFLINGER_FOD_LIB := //$(VENDOR_PATH):libfod_extension.oneplus_msmnile

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(VENDOR_PATH)/config.fs

# Fingerprint
SOONG_CONFIG_NAMESPACES += ONEPLUS_MSMNILE_FOD
SOONG_CONFIG_ONEPLUS_MSMNILE_FOD := POS_X POS_Y SIZE

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
GNSS_HIDL_VERSION := 1.1
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

# HIDL
DEVICE_MATRIX_FILE += device/qcom/common/compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(VENDOR_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(VENDOR_PATH)/oneplus_vendor_framework_compatibility_matrix.xml \
    vendor/qcom/opensource/core-utils/vendor_framework_compatibility_matrix.xml

ODM_MANIFEST_FILES := $(VENDOR_PATH)/manifest-qva.xml

ODM_MANIFEST_3_FILES := \
    $(VENDOR_PATH)/manifest-qva.xml \
    $(VENDOR_PATH)/manifest_3.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(VENDOR_PATH):libinit_oneplus-sm8150
TARGET_RECOVERY_DEVICE_MODULES := libinit_oneplus-sm8150

# Keystore
TARGET_PROVIDES_KEYMASTER := true

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USES_MKE2FS := true

# Power
TARGET_RPM_MASTER_STAT := "/d/rpmh/master_stats"
TARGET_RPM_STAT := "/d/rpmh/stats"
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"
TARGET_WLAN_POWER_STAT := "/sys/kernel/wlan/power_stats"

# Recovery
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-02-01

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(VENDOR_PATH)/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(VENDOR_PATH)/sepolicy/public
BOARD_SEPOLICY_DIRS += $(VENDOR_PATH)/sepolicy/vendor

# Sensors
SOONG_CONFIG_NAMESPACES += ONEPLUS_MSMNILE_SENSORS
SOONG_CONFIG_ONEPLUS_MSMNILE_SENSORS := ALS_POS_X ALS_POS_Y

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
