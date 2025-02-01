all: create_img

create_img:
	cd init && find . | cpio -o -H newc > ../src/init.cpio
	cd ..
	gzip -9 src/init.cpio -c > src/init.gz
	rm src/init.cpio

	mkisofs -o bin/NoodleOS.iso \
	-b isolinux/isolinux.bin -c isolinux/boot.cat \
	-no-emul-boot -boot-load-size 4 -boot-info-table \
	src