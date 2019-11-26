#import <UIKit/UIKit.h>
#import "../headers/ControlCenterUIKit/CCUIToggleModule.h"
#import "../Common.h"

@interface PCCSafeMode : CCUIToggleModule <UIAlertViewDelegate>
@property (nonatomic, assign, readwrite) BOOL fakeEnabledSetting;
@end

@implementation PCCSafeMode
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

    [[[UIAlertView alloc] initWithTitle:nil message:@"Confirm Safe Mode" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil] show];
	[super refreshState];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex]) {
        SpringBoard *sb = (SpringBoard *)[%c(SpringBoard) sharedApplication];
        [sb performSelector:@selector(enterSafeMode) withObject:nil afterDelay:0.0];
    }
}
@end
