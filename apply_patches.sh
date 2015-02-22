#!/bin/bash
# from https://github.com/dferg/zlegacy_android_device_msm8660_skyrocket
# make sure you source build/envsetup.sh and lunch before executing this script

reverse_merge_arg="-N"

for arg in "$@"
do
	if [ "$arg" = "-R" ]
	then
		reverse_merge_arg="-R"
	fi
done

for file in `dir -d patches/*`; do
	echo "**"
	echo "** ****** Applying patch: patches/$file *******"
	echo "**"
	patch -d $ANDROID_BUILD_TOP -i $PWD/$file -p0 $reverse_merge_arg -r -
	echo ""
	echo ""
	echo ""
done

