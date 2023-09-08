#!/bin/bash

if [ -f /tmp/.xradio_lock ] ; then
    exit 0
fi

touch /tmp/.xradio_lock

if [ -f /etc/default/xradio_crash_handler ] ; then
    . /etc/default/xradio_crash_handler
fi

if [ ${handler:-module_reload} = module_reload ] ; then
    /usr/sbin/rmmod xradio_wlan
    sleep 1
    /usr/sbin/modprobe xradio_wlan
    rm /tmp/.xradio_lock
elif [ ${handler} = normal_reboot ] ; then
    /usr/sbin/reboot
elif [ ${handler} = kexec_reboot ] ; then
    kexec -l /vmlinuz --initrd=/initrd.img && \
        systemctl kexec
elif [ ${handler} = crash_kernel ] ; then
    echo c >/proc/sysrq-trigger
fi

exit 0
