ARCHS = armv7 armv7s arm64
TARGET = iphone:clang::6.0
include theos/makefiles/common.mk

TWEAK_NAME = PowerCCModules
SUBPROJECTS += PCCRespring
SUBPROJECTS += PCCReboot
SUBPROJECTS += PCCShutdown
SUBPROJECTS += PCCSafeMode
# SUBPROJECTS += PCCKillBackboard

include $(THEOS_MAKE_PATH)/aggregate.mk

sync: stage
	rsync -e "ssh -p 2222" -z -r .theos/_/Library/ControlCenter/Bundles/* root@127.0.0.1:/Library/ControlCenter/Bundles/
	@ssh root@127.0.0.1 -p 2222 killall SpringBoard