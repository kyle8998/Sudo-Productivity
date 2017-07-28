#!/usr/bin/env bash

echo -e "Parsing of 2747 .bb files complete (0 cached, 2747 parsed). 6533 targets, 1299 skipped, 0 masked, 0 errors."
sleep .1
echo -e "\e[1mNOTE\e[0m: Resolving any missing task queue dependencies"
sleep .02
echo -e
sleep .1
echo -e "Build Configuration:"
sleep .1
echo -e "BB_VERSION        = \"1.30.0\""
sleep .04
echo -e "BUILD_SYS         = \"x86_64-linux\""
sleep .03
echo -e "NATIVELSBSTRING   = \"CentOSLinux-7.3.1611\""
sleep .04
echo -e "TARGET_SYS        = \"x86_64-ngc-linux\""
sleep .03
echo -e "MACHINE           = \"ros-qemux86-64\""
sleep .03
echo -e "DISTRO            = \"ros\""
sleep .02
echo -e "DISTRO_VERSION    = \"2017.08\""
sleep .01
echo -e "TUNE_FEATURES     = \"m64 corei7\""
sleep .1
echo -e "TARGET_FPU        = \"\""
sleep .1
echo -e "meta"
sleep .1
echo -e "meta-poky"
sleep .04
echo -e "meta-yocto-bsp    = \"HEAD:9930fca92bc6a959d2e151909b2d199b8497bfca\""
sleep .04
echo -e "meta-integrity    = \"HEAD:9edf1c957e707f51c22a3b3eb88288594c2f91e1\""
sleep .1
echo -e "meta-networking"
sleep .1
echo -e "meta-oe"
sleep .1
echo -e "meta-perl"
sleep .02
echo -e "meta-python       = \"HEAD:2092396f0e4fd3891b398c7180528aba67e1d522\""
sleep .02
echo -e "meta-ros          = \"integ:191b95c4535f4859e986f0255a24ce85fd70c7ee\""
sleep .02
echo -e "meta-security     = \"HEAD:a7ae942a5d2e5a41d4caf653ed074949a80a381e\""
sleep .02
echo -e "meta              = \"HEAD:350fd5d16888b3882b861ce955a3383e99420bd4\""
sleep .1
echo -e "meta-ros-qemu     = \"integ:191b95c4535f4859e986f0255a24ce85fd70c7ee\""
sleep .1
echo -e
sleep .01
echo -e "\e[1mNOTE\e[0m: Preparing RunQueue"
sleep .01
echo -e "\e[1mNOTE\e[0m: Executing SetScene Tasks"
sleep .01
echo -e "\e[1mNOTE\e[0m: Executing RunQueue Tasks"
sleep .2
echo -e "\e[33mWARNING: gnu-config-native-20150728+gitAUTOINC+b576fa87c1-r0 do_fetch: Failed to fetch URL git://git.sv.gnu.org/config.git, attempting MIRRORS if available"
sleep .02
echo -e "WARNING: pkgconfig-native-0.29+gitAUTOINC+5914edfe96-r0 do_fetch: Failed to fetch URL git://anongit.freedesktop.org/pkg-config, attempting MIRRORS if available"
sleep .02
echo -e "WARNING: zlib-native-1.2.8-r0 do_fetch: Failed to fetch URL http://www.zlib.net/zlib-1.2.8.tar.xz, attempting MIRRORS if available"
sleep .02
echo -e "WARNING: ncurses-native-6.0+20160213-r0 do_fetch: Failed to fetch URL git://anonscm.debian.org/collab-maint/ncurses.git, attempting MIRRORS if available"
sleep .02
echo -e "WARNING: glibc-initial-2.23-r0 do_fetch: Failed to fetch URL git://sourceware.org/git/glibc.git;branch=release/2.23/master;name=glibc, attempting MIRRORS if available"
sleep .02
echo -e "WARNING: binutils-cross-x86_64-2.26-r0 do_fetch: Failed to fetch URL git://sourceware.org/git/binutils-gdb.git;branch=binutils-2_26-branch;protocol=git, attempting MIRRORS if available"
sleep .1
echo -e "\e[39m"

