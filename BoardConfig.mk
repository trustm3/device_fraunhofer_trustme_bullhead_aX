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

# inherit trustme generic stuff, e.g., sepolicy
-include device/fraunhofer/trustme_generic/TrustmeBoardConfig.mk

# inherit from bullhead 
-include device/lge/bullhead/BoardConfig.mk

## set target device to bullhead instead of trustme_bullhead
## otherwise jf-common would not include necessary subdirs in its Android.mk 
TARGET_DEVICE := bullhead

# we build our kernel outside the tree
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true

BOARD_SYSTEMIMAGE_PARTITION_SIZE :=  550000000
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 2000

# overwrite wlan device variable to activate wifi-hal stub library
BOARD_WLAN_DEVICE := none

ENABLE_CPUSETS :=
