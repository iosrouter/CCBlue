TARGET := iphone:clang:latest:16.5
export SYSROOT = $(THEOS)/sdks/iPhoneOS16.5.sdk
INSTALL_TARGET_PROCESSES = Preferences

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CCBlue
CCBlue_BUNDLE_EXTENSION = bundle
CCBlue_FILES = CCBlue.m
CCBlue_CFLAGS = -fobjc-arc
CCBlue_FRAMEWORKS = UIKit
CCBlue_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CCBlue_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
SUBPROJECTS += ccblue
include $(THEOS_MAKE_PATH)/aggregate.mk
