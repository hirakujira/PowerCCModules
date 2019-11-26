GO_EASY_ON_ME=1
ARCHS = arm64 arm64e
TARGET = iphone:clang::11.0
SYSROOT = /opt/theos/sdks/iPhoneOS11.2.sdk
SDKVERSION = 11.2
include ../theos/makefiles/common.mk

BUNDLE_NAME = PCCReboot
PCCReboot_FILES = Switch.xm
PCCReboot_CFLAGS +=  -fobjc-arc -I$(THEOS_PROJECT_DIR)/headers -Wno-deprecated-declarations
PCCReboot_LDFLAGS += ../Frameworks/ControlCenterUIKit.tbd
PCCReboot_FRAMEWORKS += UIKit
PCCReboot_INSTALL_PATH = /Library/ControlCenter/Bundles

include ../theos/makefiles/bundle.mk
