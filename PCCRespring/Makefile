GO_EASY_ON_ME=1
ARCHS = armv7 arm64
TARGET = iphone:clang::
include ../theos/makefiles/common.mk

BUNDLE_NAME = PCCRespring
PCCRespring_FILES = Switch.xm
PCCRespring_CFLAGS +=  -fobjc-arc -I$(THEOS_PROJECT_DIR)/headers
PCCRespring_LDFLAGS += ../Frameworks/ControlCenterUIKit.tbd
PCCRespring_FRAMEWORKS += UIKit
PCCRespring_INSTALL_PATH = /Library/ControlCenter/Bundles

include ../theos/makefiles/bundle.mk
