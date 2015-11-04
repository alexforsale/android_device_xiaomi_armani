LOCAL_PATH := $(call my-dir)

# use separate boot image arguments for ubuntu boot.img
INTERNAL_BOOTIMAGE_ARGS_UBUNTU := \
    --cmdline "$(BOARD_KERNEL_CMDLINE)" \
    --base $(BOARD_KERNEL_BASE) \
    --pagesize $(BOARD_KERNEL_PAGESIZE)

## Build and run dtbtool
DTBTOOL := $(HOST_OUT_EXECUTABLES)/dtbToolCM$(HOST_EXECUTABLE_SUFFIX)
INSTALLED_DTIMAGE_TARGET := $(PRODUCT_OUT)/dt.img

$(INSTALLED_DTIMAGE_TARGET): $(DTBTOOL) $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr $(INSTALLED_KERNEL_TARGET)
	$(call pretty,"Target dt image: $(INSTALLED_DTIMAGE_TARGET)")
	$(hide) $(DTBTOOL) -2 -o $(INSTALLED_DTIMAGE_TARGET) -s $(BOARD_KERNEL_PAGESIZE) -p $(KERNEL_OUT)/scripts/dtc/ $(KERNEL_OUT)/arch/arm/boot/
	@echo -e ${CL_CYN}"Made DT image: $@"${CL_RST}

## Overload android bootimg generation: Same as the original, + --dt arg
$(INSTALLED_BOOTIMAGE_TARGET_ANDROID): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES_ANDROID) $(INSTALLED_DTIMAGE_TARGET)
	$(call pretty,"Target android boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS_ANDROID) $(BOARD_MKBOOTIMG_ARGS) --dt $(INSTALLED_DTIMAGE_TARGET) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made android boot image: $@"${CL_RST}

## Overload ubuntu bootimg generation: Same as the original, + --dt arg
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES_) $(INSTALLED_DTIMAGE_TARGET)
	$(call pretty,"Target boot image for Ubuntu Touch: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(INTERNAL_BOOTIMAGE_ARGS_UBUNTU) $(BOARD_MKBOOTIMG_ARGS) --dt $(INSTALLED_DTIMAGE_TARGET) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made ubuntu boot image: $@"${CL_RST}

## Overload recoveryimg generation: Same as the original, + --dt arg
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(INSTALLED_DTIMAGE_TARGET) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --dt $(INSTALLED_DTIMAGE_TARGET) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
