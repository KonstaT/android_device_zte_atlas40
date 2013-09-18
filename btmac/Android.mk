#
# Copyright (c) 2013, Rudolf Tammekivi.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 and
# only version 2 as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#


LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := btmac

LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := -DLOG_TAG=\"BT_MAC\"

LOCAL_SRC_FILES := \
	btmac.c

LOCAL_SHARED_LIBRARIES := libc libcutils liblog

# Proprietary
LOCAL_SHARED_LIBRARIES += liboncrpc
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/liboncrpc_intermediates/)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/liboncrpc_intermediates/export_includes)

LOCAL_SHARED_LIBRARIES += libnv
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libnv_intermediates/)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libnv_intermediates/export_includes)

include $(BUILD_EXECUTABLE)
