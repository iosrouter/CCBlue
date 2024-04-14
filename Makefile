TARGET := iphone:clang:latest:15.6
INSTALL_TARGET_PROCESSES = Preferences

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CCBlue
CCBlue_BUNDLE_EXTENSION = bundle
CCBlue_FILES = CCBlue.m
CCBlue_CFLAGS = -fobjc-arc
CCBlue_FRAMEWORKS = UIKit
CCBlue_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CCBlue_LIBRARIES = imagepicker
CCBlue_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
SUBPROJECTS += ccblue
SUBPROJECTS += ccbluedevice1
SUBPROJECTS += ccbluedevice2
SUBPROJECTS += ccbluedevice3
SUBPROJECTS += ccbluedevice4
SUBPROJECTS += ccbluedevice5
include $(THEOS_MAKE_PATH)/aggregate.mk
