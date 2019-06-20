##########################################################
# File Name		: m_for_qemu.sh
# Author		: winddoing
# Created Time	: 2018年12月13日 星期四 15时40分16秒
# Description	:
##########################################################
#!/bin/bash
if [ ! -n "${TOPDIR}" ];then
	echo "Please execute the command (source envsetup.sh) in the project root directory"
	exit 1;
fi

ARCH=arm64
IMAGE="${TOPDIR}/image_file"

if [ $ARCH == "arm64" ]; then
	echo "Build arm64 ..."
	make defconfig #arm64
	make all -j4
	cp -fv ./arch/arm64/boot/Image ${IMAGE}
else
	echo "Build arm ..."
	make vexpress_defconfig
	make zImage -j2
	make dtbs
	cp -fv ./arch/arm/boot/zImage ${IMAGE}
	cp -fv ./arch/arm/boot/dts/*ca9.dtb ${IMAGE}
fi

cp -fv ./vmlinux ${IMAGE}
