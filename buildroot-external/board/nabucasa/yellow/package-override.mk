# Buildroot includes this file before the package makefiles, so "override"
# makes these values win over the assignments in package/rpi-firmware.

# The firmware must match the 5.15 Raspberry Pi kernel in the defconfig
override RPI_FIRMWARE_VERSION = 61966732d03de9b71baf561f920e018b54c241ac
override RPI_FIRMWARE_HASH_FILE = $(BR2_EXTERNAL_INSTALLER_PATH)/board/nabucasa/yellow/rpi-firmware.hash

# This file replaces the default local.mk, so keep including it
-include $(CONFIG_DIR)/local.mk
