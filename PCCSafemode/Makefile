GO_EASY_ON_ME=1
ARCHS = armv7 arm64 arm64e
TARGET = iphone:clang::
include ../theos/makefiles/common.mk

BUNDLE_NAME = PCCSafeMode
PCCSafeMode_FILES = Switch.xm
PCCSafeMode_CFLAGS +=  -fobjc-arc -I$(THEOS_PROJECT_DIR)/headers
PCCSafeMode_LDFLAGS += ../Frameworks/ControlCenterUIKit.tbd
PCCSafeMode_FRAMEWORKS += UIKit
PCCSafeMode_INSTALL_PATH = /Library/ControlCenter/Bundles

include ../theos/makefiles/bundle.mk
