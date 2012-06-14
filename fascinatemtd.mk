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
# crespo. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Note that crespo is not a fully open device. Some of the drivers
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
DEVICE_PACKAGE_OVERLAYS := device/samsung/fascinatemtd/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES := \
	device/samsung/fascinatemtd/asound.conf:system/etc/asound.conf \
	device/samsung/fascinatemtd/vold.fstab:system/etc/vold.fstab \
	device/samsung/aries-common/egl.cfg:system/lib/egl/egl.cfg \
	device/samsung/aries-common/mxt224_ts_input.idc:system/usr/idc/mxt224_ts_input.idc \
	device/samsung/aries-common/main.conf:system/etc/bluetooth/main.conf

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/fascinatemtd/init.aries.rc:root/init.aries.rc \
	device/samsung/aries-common/init.aries.usb.rc:root/init.aries.usb.rc \
	device/samsung/aries-common/init.aries.usb.rc:recovery/root/usb.rc \
	device/samsung/aries-common/lpm.rc:root/lpm.rc \
	device/samsung/fascinatemtd/ueventd.aries.rc:root/ueventd.aries.rc \
	device/samsung/aries-common/setupdatadata.sh:root/sbin/setupdatadata.sh \
	bootable/recovery/nandroid-md5.sh:recovery/root/sbin/nandroid-md5.sh

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/aries-common/cypress-touchkey.kl:system/usr/keylayout/cypress-touchkey.kl \
	device/samsung/aries-common/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/fascinatemtd/aries-keypad.kl:system/usr/keylayout/aries-keypad.kl \
	device/samsung/aries-common/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl

# Generated kcm keymaps
PRODUCT_PACKAGES := \
       cypress-touchkey.kcm \
       s3c-keypad.kcm

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs \
	bml_over_mtd

# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/aries-common/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
	device/samsung/aries-common/media_profiles.xml:system/etc/media_profiles.xml

# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
	libSEC_OMX_Core.aries \
	libOMX.SEC.AVC.Decoder.aries \
	libOMX.SEC.M4V.Decoder.aries \
	libOMX.SEC.M4V.Encoder.aries \
	libOMX.SEC.AVC.Encoder.aries

# Misc other modules
PRODUCT_PACKAGES += \
	hwcomposer.aries \
	camera.aries \
	audio.primary.aries \
	audio_policy.aries \
	audio.a2dp.default \
	libs3cjpeg \
	sensors.aries

# Libs
PRODUCT_PACKAGES += \
	libstagefrighthw

# Device-specific packages
PRODUCT_PACKAGES += \
	AriesParts \
	tvouthack

# apns
PRODUCT_COPY_FILES += \
	development/data/etc/apns-conf.xml:system/etc/apns-conf.xml

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
        frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072

# Verizon cdma stuff
PRODUCT_PROPERTY_OVERRIDES += \
       ro.telephony.default_network=4 \
       ro.ril.def.agps.mode=2 \
       ro.cdma.home.operator.numeric=310004 \
       ro.cdma.home.operator.alpha=Verizon \
       ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
       ro.cdma.data_retry_config=default_randomization=2000,0,0,120000,180000,540000,960000 \
       ro.cdma.otaspnumschema=SELC,3,00,07,80,87,88,99 \
       ro.config.vc_call_vol_steps=15 \
       ro.telephony.call_ring.multiple=false \
       ro.telephony.call_ring.delay=3000 \
       net.cdma.pppd.authtype=require-chap \
       net.cdma.pppd.user=user[SPACE]VerizonWireless \
       net.cdma.datalinkinterface=/dev/ttyCDMA0 \
       net.cdma.ppp.interface=ppp0 \
       net.connectivity.type=CDMA1 \
       net.interfaces.defaultroute=cdma \
       mobiledata.interfaces=ppp0 \
       ro.ril.samsung_cdma=true \
       ro.telephony.ril_class=SamsungRIL \
       ro.telephony.ril.v3=datacall

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
       wifi.interface=wlan0

# Dalvik heap size
include frameworks/base/build/phone-hdpi-512-dalvik-heap.mk


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

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# We have sacrificed /cache for a larger /system, so it's not large enough for dalvik cache
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage

# disable usb debugging notif
PRODUCT_PROPERTY_OVERRIDES += \
    persist.adb.notify=0

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# kernel modules
PRODUCT_COPY_FILES += $(foreach module,\
	$(wildcard device/samsung/fascinatemtd/*.ko),\
	$(module):system/lib/modules/$(notdir $(module)))

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/fascinatemtd/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/samsung/aries-common/updater.sh:updater.sh

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/fascinatemtd/fascinatemtd-vendor.mk)
