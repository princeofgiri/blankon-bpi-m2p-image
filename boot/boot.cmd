gpio set PL10
gpio set PG11
setenv machid 1029
setenv bootm_boot_mode sec
setenv verbosity 1
setenv bootargs "console=ttyS0 console=tty1 root=/dev/mmcblk0p2 rootwait rootfstype=ext2 cgroup_enable=memory swapaccount=1 sunxi_ve_mem_reserve=0 sunxi_g2d_mem_reserve=0 sunxi_no_mali_mem_reserve sunxi_fb_mem_reserve=16 panic=10 consoleblank=0 enforcing=0 loglevel=${verbosity}"

ext2load mmc 0 0x43000000 /boot/script.bin
ext2load mmc 0 0x42000000 /boot/uInitrd
ext2load mmc 0 0x48000000 /boot/zImage
bootz 0x48000000 0x42000000

# Recompile with:
# mkimage -C none -A arm -T script -d boot.cmd boot.scr 
