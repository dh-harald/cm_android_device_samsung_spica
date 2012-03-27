# Copyright (C) 2010 The Android Open Source Project
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


# This file is the device-specific product definition file for
# spica. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Note that spica is not a fully open device. Some of the drivers
# aren't publicly available in all circumstances, which means that some
# of the hardware capabilities aren't present in builds where those
# drivers aren't available. Such cases are handled by having this file
# separated into two halves: this half here contains the parts that
# are available to everyone, while another half in the vendor/ hierarchy
# augments that set with the parts that are only relevant when all the
# associated drivers are available. Aspects that are irrelevant but
# harmless in no-driver builds should be kept here for simplicity and
# transparency. There are two variants of the half that deals with
# the unavailable drivers: one is directly checked into the unreleased
# vendor tree and is used by engineers who have access to it. The other
# is generated by setup-makefile.sh in the same directory as this files,
# and is used by people who have access to binary versions of the drivers
# but not to the original vendor tree. Be sure to update both.


# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS := device/samsung/spica/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES := \
    device/samsung/spica/egl.cfg:system/lib/egl/egl.cfg \
    device/samsung/spica/vold.fstab:system/etc/vold.fstab \
    device/samsung/spica/recovery.fstab:system/etc/recovery.fstab \
    device/common/gps/gps.conf_EU_SUPL:system/etc/gps.conf
#    device/common/gps/gps.conf_EU_SUPL:system/etc/gps.conf \
#    device/samsung/spica/media_profiles.xml:system/etc/media_profiles.xml

# Init files
PRODUCT_COPY_FILES += \
    device/samsung/spica/init.rc:root/init.rc \
    device/samsung/spica/init.spica.rc:root/init.spica.rc \
    device/samsung/spica/ueventd.spica.rc:root/ueventd.spica.rc \
    device/samsung/spica/recovery.rc:root/recovery.rc \
    device/samsung/spica/recovery.fstab:root/system/etc/recovery.fstab


# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
    device/samsung/spica/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
    device/samsung/spica/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/spica/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Prebuilt RIL files
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/ril/libsecril-client.so:system/lib/libsecril-client.so \
    device/samsung/spica/prebuilt/ril/libsecril-client.so:obj/lib/libsecril-client.so \
    device/samsung/spica/prebuilt/ril/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/spica/prebuilt/ril/libril.so:system/lib/libril.so \
    device/samsung/spica/prebuilt/ril/efsd:system/bin/efsd

# Generated kcm keymaps
PRODUCT_PACKAGES := \
    samsung-keypad.kcm \
    gpio-keys.kcm

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/samsung/spica/qt5480_ts_input.idc:system/usr/idc/qt5480_ts_input.idc

# Libs
PRODUCT_PACKAGES += \
    audio.primary.spica \
    lights.spica \
    sensors.spica \
    gps.spica \
    libs3cjpeg \
    libcamera \
    bdaddr_read \
    show_logo \
    gralloc.spica \
    libsecgps.so \
    libGLES_fimg \
    hwcomposer.default \
    audio_policy.default \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
        make_ext4fs \
        setup_fs

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Sensors
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/akmd/akmd:system/bin/akmd

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/wifi/nvram.txt:system/etc/nvram.txt \
    device/samsung/spica/prebuilt/wifi/fw_bcm4325.bin:system/etc/fw_bcm4325.bin \
    device/samsung/spica/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/bt/bcm4325.hcd:system/etc/bcm4325.hcd

# Boot logo
PRODUCT_COPY_FILES += \
    device/samsung/spica/bootlogo.png:system/etc/bootlogo.png

# Used by BusyBox
KERNEL_MODULES_DIR:=/lib/modules

# Enable Windows Media if supported by the board
WITH_WINDOWS_MEDIA:=true

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=65537 \
    ro.sf.lcd_density=160

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
       wifi.interface=wlan0 \
       wifi.supplicant_scan_interval=20 \
       ro.telephony.ril_class=SpicaRIL \
       ro.telephony.ril.v3=facilitylock,icccardstatus,datacall,skipbrokendatacall,signalstrength \
       mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
       dalvik.vm.heapsize=32m \
       dalvik.vm.dexopt-data-only=1 \

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.locationfeatures=1 \
        ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Kernel
LOCAL_KERNEL := device/samsung/spica/kernel.bin
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/spica/spica-vendor.mk)

BOARD_WLAN_DEVICE_REV := bcm4325
WIFI_BAND             := 802_11_ABG
