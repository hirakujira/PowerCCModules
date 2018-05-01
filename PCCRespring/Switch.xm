#import "../headers/ControlCenterUIKit/CCUIToggleModule.h"
#import <UIKit/UIKit.h>
#import <notify.h>

@interface SpringBoard : UIApplication
- (void)_relaunchSpringBoardNow;
- (void)reboot;
- (void)powerDown;
@end

@interface BKSRestartAction : NSObject
+ (id)actionWithOptions:(NSInteger)options;
@end

@interface FBSystemService : NSObject
+ (id)sharedInstance;
- (void)shutdownAndReboot:(bool)arg1;
@end

@interface FBSystemApp : NSObject
+ (id)sharedApplication;
- (void)sendActionsToBackboard:(NSSet *)actions;
@end

@interface UIImage ()
+ (UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;
@end

@interface PCCSafemode : CCUIToggleModule <UIAlertViewDelegate>
@property (nonatomic, assign, readwrite) BOOL fakeEnabledSetting;
@end

@implementation PCCSafemode

static int callback(void *sc, CFStringRef string, CFDictionaryRef dictionary, void *data) {
    NSLog(@"callback (but it never calls me back :( ))\n");
    return 0;
}

- (UIImage *)iconGlyph {
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]]];
}

- (UIColor *)selectedColor {
	return [UIColor colorWithRed:0.972 green:0.8 blue:0.274 alpha:1];
}

- (BOOL)isSelected {
	return self.fakeEnabledSetting;
}

- (void)setSelected:(BOOL)selected {
    selected = NO;
	self.fakeEnabledSetting = selected;

    [[[UIAlertView alloc] initWithTitle:nil message:@"Confirm Respring" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil] show];
	[super refreshState];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex])
    {
        SpringBoard *sb = (SpringBoard *)[%c(SpringBoard) sharedApplication];
        if ([sb respondsToSelector:@selector(relaunchSpringBoard)]) {
            [sb _relaunchSpringBoardNow];
        }
    	else {
            FBSystemApp *fb = (FBSystemApp *)[%c(FBSystemApp) sharedApplication];
        	[fb sendActionsToBackboard:
                [NSSet setWithObject:[%c(BKSRestartAction) actionWithOptions:1]]];
    	}	
    }
}
@end
