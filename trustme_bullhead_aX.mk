#
# This file is part of trust|me
# Copyright(c) 2013 - 2018 Fraunhofer AISEC
# Fraunhofer-Gesellschaft zur Förderung der angewandten Forschung e.V.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms and conditions of the GNU General Public License,
# version 2 (GPL 2), as published by the Free Software Foundation.
#
# This program is distributed in the hope it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GPL 2 license for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <http://www.gnu.org/licenses/>
#
# The full GNU General Public License is included in this distribution in
# the file called "COPYING".
#
# Contact Information:
# Fraunhofer AISEC <trustme@aisec.fraunhofer.de>
#

# Get the long list of APNs
PRODUCT_COPY_FILES := device/lge/bullhead/apns-full-conf.xml:system/etc/apns-conf.xml

## Overwrite disabled functions with empty xml (needs to be done before anything else is included)
#PRODUCT_COPY_FILES += \
#    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
#    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.usb.host.xml
## Copy trustme specific handheld_core_hardware.xml (e.g., removed camera and bluetooth)
#PRODUCT_COPY_FILES += \
#    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/handheld_core_hardware.xml \
#    device/fraunhofer/trustme_generic/trustme_generic_hardware.xml:system/etc/permissions/trustme_generic_hardware.xml
## extracted features like bluetooth which can be cleaned by postprocessing in trustme-main.mk
#PRODUCT_COPY_FILES += \
#    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
#    frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# overlay needs to be defined before generic or hardware include/inherit to take precedence
DEVICE_PACKAGE_OVERLAYS += device/fraunhofer/trustme_bullhead_aX/overlay

# Enable the Google network and fused location providers
PRODUCT_PACKAGE_OVERLAYS += device/sample/overlays/location
PRODUCT_PACKAGES += NetworkLocation

## overwrite dalvik parameters with values for a 1GB device
#$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

TARGET_USES_NANOHUB_SENSORHAL := false

# Inherit from bullhead device
$(call inherit-product, device/lge/bullhead/device.mk)

# do not use binarie from any device specicifc bullhead-kernel.git
TARGET_PREBUILT_KERNEL := device/fraunhofer/trustme_bullhead_aX/dummy_kernel

include device/fraunhofer/trustme_generic/trustme_generic_aX.mk

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := trustme_bullhead_aX
PRODUCT_DEVICE := bullhead
PRODUCT_BRAND := Android
PRODUCT_MODEL := trust-me AndroidX for bullhead
PRODUCT_MANUFACTURER := fraunhofer
PRODUCT_MODEL := bullhead
OUT_DIR := out-aosp

TARGET_USES_NANOHUB_SENSORHAL := false

#PRODUCT_COPY_FILES += \
#    device/fraunhofer/trustme_bullhead_aX/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# include binary blobs
$(call inherit-product-if-exists, vendor/lge/bullhead/device-vendor.mk)
$(call inherit-product-if-exists, vendor/lge/bullhead/bullhead-vendor.mk)
