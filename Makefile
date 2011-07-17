ifneq ($(KERNELRELEASE),)
# kbuild part of makefile
ifndef CONFIG_NF_CONNTRACK
$(error ** You need to enable NF_CONNTRACK in your kernel **)
endif

obj-m := nf_conntrack_rtsp.o nf_nat_rtsp.o
else

# Normal Makefile

KERNELSRC := /lib/modules/`uname -r`/build
all: 
	$(MAKE) -C $(KERNELSRC) M=`pwd` modules

debug:
	$(MAKE) -C $(KERNELSRC) EXTRA_CFLAGS=-DDEBUG M=`pwd` modules

modules_install:
	$(MAKE) -C $(KERNELSRC) M=`pwd` modules_install

clean:
	rm -rf *.o *.ko *.mod.c .*.cmd Module.symvers modules.order .tmp_versions

endif
