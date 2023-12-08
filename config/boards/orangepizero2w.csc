# Allwinner H618 quad core 1GB/1.5GB/2GB/4GB RAM SoC WiFi SPI USB-C
BOARD_NAME="Orange Pi Zero2w"
BOARDFAMILY="sun50iw9"
BOARD_MAINTAINER=""
BOOTCONFIG="orangepi_zero2w_defconfig"
MODULES_LEGACY="uwe5622_bsp_sdio sprdbt_tty sprdwl_ng"
DEFAULT_CONSOLE="both"
SERIALCON="ttyS0"
KERNEL_TARGET="edge"
KERNEL_TEST_TARGET="edge" # in case different then kernel target
PACKAGE_LIST_BOARD="rfkill bluetooth bluez bluez-tools"
FORCE_BOOTSCRIPT_UPDATE="yes"
