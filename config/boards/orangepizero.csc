# Allwinner H2+ quad core 256/512MB RAM SoC WiFi SPI
BOARD_NAME="Orange Pi Zero"
BOARDFAMILY="sun8i"
BOARD_MAINTAINER=""
BOOTCONFIG="orangepi_zero_defconfig"
MODULES_CURRENT="g_serial"
MODULES_BLACKLIST="sunxi_cedrus"
DEFAULT_OVERLAYS="usbhost2 usbhost3 tve"
DEFAULT_CONSOLE="both"
HAS_VIDEO_OUTPUT="yes"
SERIALCON="ttyS0,ttyGS0"
KERNEL_TARGET="legacy,current,edge"

function add_host_dependencies__orangepizero_install_kexec_tools(){
	display_alert "Adding package" "kexec-tools" "debug"
	add_packages_to_image kexec-tools
}

function pre_customize_image__orangepizero_reboot_on_xradio_failure(){
	echo ':msg, contains, "BH: firmware exception!", ^/usr/local/sbin/xradio_crash_handler.sh' >"${SDCARD}"/etc/rsyslog.d/xradio_crash.conf
	echo ':msg, contains, "CMD timeout!>>>", ^/usr/local/sbin/xradio_crash_handler.sh' >"${SDCARD}"/etc/rsyslog.d/xradio_crash.conf

	cp "${SRC}"/packages/bsp/xradio/usr/local/sbin/xradio_crash_handler.sh "${SDCARD}"/usr/local/sbin/
	chmod a+x "${SDCARD}"/usr/local/sbin/xradio_crash_handler.sh

	cp "${SRC}"/packages/bsp/xradio/etc/default/xradio_crash_handler "${SDCARD}"/etc/default/
}
