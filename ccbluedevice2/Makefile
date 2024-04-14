TARGET := iphone:clang:latest:11.0
INSTALL_TARGET_PROCESSES = Preferences

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CCBlueDevice2
CCBlueDevice2_BUNDLE_EXTENSION = bundle
CCBlueDevice2_FILES = CCBlueDevice2.m
CCBlueDevice2_CFLAGS = -fobjc-arc
CCBlueDevice2_FRAMEWORKS = UIKit
CCBlueDevice2_LIBRARIES = imagepicker
CCBlueDevice2_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CCBlueDevice2_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
