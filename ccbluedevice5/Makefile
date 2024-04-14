TARGET := iphone:clang:latest:11.0
INSTALL_TARGET_PROCESSES = Preferences

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CCBlueDevice5
CCBlueDevice5_BUNDLE_EXTENSION = bundle
CCBlueDevice5_FILES = CCBlueDevice5.m
CCBlueDevice5_CFLAGS = -fobjc-arc
CCBlueDevice5_FRAMEWORKS = UIKit
CCBlueDevice5_LIBRARIES = imagepicker
CCBlueDevice5_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CCBlueDevice5_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
