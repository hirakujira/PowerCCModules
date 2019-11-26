GO_EASY_ON_ME=1
ARCHS = arm64 arm64e
TARGET = iphone:clang::11.0
SYSROOT = /opt/theos/sdks/iPhoneOS11.2.sdk
SDKVERSION = 11.2
include ../theos/makefiles/common.mk

BUNDLE_NAME = PCCRespring
PCCRespring_FILES = Switch.xm
PCCRespring_CFLAGS +=  -fobjc-arc -I$(THEOS_PROJECT_DIR)/headers -Wno-deprecated-declarations
PCCRespring_LDFLAGS += ../Frameworks/ControlCenterUIKit.tbd
PCCRespring_FRAMEWORKS += UIKit
PCCRespring_INSTALL_PATH = /Library/ControlCenter/Bundles

include ../theos/makefiles/bundle.mk
