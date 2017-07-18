#!/usr/bin/env bash

echo -e "
Parsing recipes: 100% |############################################################################################################################################################################| Time: 00:01:44
Parsing of 2747 .bb files complete (0 cached, 2747 parsed). 6533 targets, 1299 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = \"1.30.0\"
BUILD_SYS         = \"x86_64-linux\"
NATIVELSBSTRING   = \"CentOSLinux-7.3.1611\"
TARGET_SYS        = \"x86_64-ngc-linux\"
MACHINE           = \"ros-qemux86-64\"
DISTRO            = \"ros\"
DISTRO_VERSION    = \"2017.08\"
TUNE_FEATURES     = \"m64 corei7\"
TARGET_FPU        = \"\"
meta
meta-poky
meta-yocto-bsp    = \"HEAD:9930fca92bc6a959d2e151909b2d199b8497bfca\"
meta-integrity    = \"HEAD:9edf1c957e707f51c22a3b3eb88288594c2f91e1\"
meta-networking
meta-oe
meta-perl
meta-python       = \"HEAD:2092396f0e4fd3891b398c7180528aba67e1d522\"
meta-ros          = \"integ:191b95c4535f4859e986f0255a24ce85fd70c7ee\"
meta-security     = \"HEAD:a7ae942a5d2e5a41d4caf653ed074949a80a381e\"
meta              = \"HEAD:350fd5d16888b3882b861ce955a3383e99420bd4\"
meta-ros-qemu     = \"integ:191b95c4535f4859e986f0255a24ce85fd70c7ee\"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
\e[33mWARNING: gnu-config-native-20150728+gitAUTOINC+b576fa87c1-r0 do_fetch: Failed to fetch URL git://git.sv.gnu.org/config.git, attempting MIRRORS if available
WARNING: pkgconfig-native-0.29+gitAUTOINC+5914edfe96-r0 do_fetch: Failed to fetch URL git://anongit.freedesktop.org/pkg-config, attempting MIRRORS if available
WARNING: zlib-native-1.2.8-r0 do_fetch: Failed to fetch URL http://www.zlib.net/zlib-1.2.8.tar.xz, attempting MIRRORS if available
WARNING: ncurses-native-6.0+20160213-r0 do_fetch: Failed to fetch URL git://anonscm.debian.org/collab-maint/ncurses.git, attempting MIRRORS if available
WARNING: glibc-initial-2.23-r0 do_fetch: Failed to fetch URL git://sourceware.org/git/glibc.git;branch=release/2.23/master;name=glibc, attempting MIRRORS if available
WARNING: binutils-cross-x86_64-2.26-r0 do_fetch: Failed to fetch URL git://sourceware.org/git/binutils-gdb.git;branch=binutils-2_26-branch;protocol=git, attempting MIRRORS if available
\e[39m
"
