TARGET := iphone:clang:latest:11.0
INSTALL_TARGET_PROCESSES = Preferences

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CCBlueDevice3
CCBlueDevice3_BUNDLE_EXTENSION = bundle
CCBlueDevice3_FILES = CCBlueDevice3.m
CCBlueDevice3_CFLAGS = -fobjc-arc
CCBlueDevice3_FRAMEWORKS = UIKit
CCBlueDevice3_LIBRARIES = imagepicker
CCBlueDevice3_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CCBlueDevice3_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
