##########################################################
# File Name		: m_for_qemu.sh
# Author		: winddoing
# Created Time	: 2018年12月13日 星期四 15时40分16秒
# Description	:
##########################################################
#!/bin/bash

make vexpress_defconfig

make zImage -j2

make dtbs

cp -fv arch/arm/boot/zImage ../for_qemu/
cp -fv arch/arm/boot/dts/*ca9.dtb ../for_qemu/
