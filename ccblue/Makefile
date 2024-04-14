TARGET := iphone:clang:latest:15.6

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ccblue

ccblue_FILES = $(wildcard *.m)
ccblue_FRAMEWORKS = UIKit
ccblue_PRIVATE_FRAMEWORKS = Preferences
ccblue_LIBRARIES = imagepicker
ccblue_INSTALL_PATH = /Library/PreferenceBundles
ccblue_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
