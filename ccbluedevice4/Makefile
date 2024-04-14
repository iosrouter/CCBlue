TARGET := iphone:clang:latest:11.0
INSTALL_TARGET_PROCESSES = Preferences

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CCBlueDevice4
CCBlueDevice4_BUNDLE_EXTENSION = bundle
CCBlueDevice4_FILES = CCBlueDevice4.m
CCBlueDevice4_CFLAGS = -fobjc-arc
CCBlueDevice4_FRAMEWORKS = UIKit
CCBlueDevice4_LIBRARIES = imagepicker
CCBlueDevice4_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CCBlueDevice4_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
