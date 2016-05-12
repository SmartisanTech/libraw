LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := libraw

LOCAL_SRC_FILES := \
    internal/dcraw_common.cpp \
    internal/dcraw_fileio.cpp \
    internal/demosaic_packs.cpp \
    missing/swab.cpp \
    src/libraw_c_api.cpp \
    src/libraw_cxx.cpp \
    src/libraw_datastream.cpp

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/internal \
    $(LOCAL_PATH)/libraw \
    $(LOCAL_PATH)/missing \
    $(LOCAL_PATH)

LOCAL_CFLAGS := -w
LOCAL_CPPFLAGS := $(LOCAL_CFLAGS) -fexceptions

BEFORE_LOLLIPOP := $(strip $(shell if [ $(PLATFORM_SDK_VERSION) -lt "21" ]; then echo true; else echo false; fi))

ifeq ($(BEFORE_LOLLIPOP), true)
LOCAL_SDK_VERSION := 18
else
LOCAL_SDK_VERSION := 21
endif

LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_LDFLAGS += -ldl

LOCAL_ARM_MODE := arm

include $(BUILD_SHARED_LIBRARY)
