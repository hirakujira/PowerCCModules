ARCHS = armv7 armv7s arm64 arm64e
TARGET = iphone:clang::6.0

TWEAK_NAME = PowerCCModules
SUBPROJECTS += PCCRespring
SUBPROJECTS += PCCReboot
SUBPROJECTS += PCCShutdown
SUBPROJECTS += PCCSafeMode

FINALPACKAGE = 1
# SUBPROJECTS += PCCKillBackboard
include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

sync: stage
	rsync -e "ssh -p 2222" -z -r .theos/_/Library/ControlCenter/Bundles/* root@127.0.0.1:/Library/ControlCenter/Bundles/
	@ssh root@127.0.0.1 -p 2222 killall SpringBoard