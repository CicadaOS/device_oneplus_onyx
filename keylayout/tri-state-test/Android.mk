LOCAL_PATH:= $(call my-dir)



include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	hello.c 

LOCAL_CFLAGS += \
	-Wall

LOCAL_MODULE := hello 
LOCAL_MODULE_TAGS := optional


include $(BUILD_EXECUTABLE)

