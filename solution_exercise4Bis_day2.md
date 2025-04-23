```bash

menuentry "Debian No Graphical mode" {
        set root=(hd0,1)
        linux /vmlinuz root=/dev/sda1 ro nomodest
        initrd /initrd.img
}
menuentry "Debian with limit to 2 CPU" {
        set root=(hd0,1)
        linux /vmlinuz root=/dev/sda1 ro maxcpus=2
        initrd /initrd.img
}


menuentry "Debian Verbose mode" {
        set root=(hd0,1)
        linux /vmlinuz root=/dev/sda1 ro verbose
        initrd /initrd.img
}

menuentry "Debian without usb" {
        set root=(hd0,1)
        linux /vmlinuz root=/dev/sda1 ro nousb
        initrd /initrd.img
}

menuentry "Debian power saving" {
        set root=(hd0,1)
        linux /vmlinuz root=/dev/sda1 ro intel_pstate=disable
        initrd /initrd.img
}

```