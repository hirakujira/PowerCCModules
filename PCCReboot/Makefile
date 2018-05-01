GO_EASY_ON_ME=1
ARCHS = armv7 arm64
TARGET = iphone:clang::
include ../theos/makefiles/common.mk

BUNDLE_NAME = PCCReboot
PCCReboot_FILES = Switch.xm
PCCReboot_CFLAGS +=  -fobjc-arc -I$(THEOS_PROJECT_DIR)/headers
PCCReboot_LDFLAGS += ../Frameworks/ControlCenterUIKit.tbd
PCCReboot_FRAMEWORKS += UIKit
PCCReboot_INSTALL_PATH = /Library/ControlCenter/Bundles

include ../theos/makefiles/bundle.mk
