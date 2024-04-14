TARGET := iphone:clang:latest:11.0
INSTALL_TARGET_PROCESSES = Preferences

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CCBlueDevice1
CCBlueDevice1_BUNDLE_EXTENSION = bundle
CCBlueDevice1_FILES = CCBlueDevice1.m
CCBlueDevice1_CFLAGS = -fobjc-arc
CCBlueDevice1_FRAMEWORKS = UIKit
CCBlueDevice1_LIBRARIES = imagepicker
CCBlueDevice1_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CCBlueDevice1_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
