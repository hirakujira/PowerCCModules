GO_EASY_ON_ME=1
ARCHS = armv7 arm64
TARGET = iphone:clang::
include ../theos/makefiles/common.mk

BUNDLE_NAME = PCCShutdown
PCCShutdown_FILES = Switch.xm
PCCShutdown_CFLAGS +=  -fobjc-arc -I$(THEOS_PROJECT_DIR)/headers
PCCShutdown_LDFLAGS += ../Frameworks/ControlCenterUIKit.tbd
PCCShutdown_FRAMEWORKS += UIKit
PCCShutdown_INSTALL_PATH = /Library/ControlCenter/Bundles

include ../theos/makefiles/bundle.mk
