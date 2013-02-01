#import "CaptainHook.h"
#import <Foundation/NSString.h>
#import <UIKit/UIApplication.h>

CHDeclareClass(UIResponder);
unsigned int i = 0; //global for rotating the status bar look

CHMethod(2,void,UIResponder, touchesBegan, NSSet *, touches, withEvent, UIEvent *, event) {
	//get status bar properties	
	UIStatusBarStyle currentStatus = [[UIApplication sharedApplication] statusBarStyle];
	
	UIInterfaceOrientation currentOrientation = [[UIApplication sharedApplication] statusBarOrientation];
	
	BOOL isHidden = [[UIApplication sharedApplication] isStatusBarHidden];
	//change status bar properties
	switch(i) {
	case 0:
		currentStatus = UIStatusBarStyleBlackTranslucent;
		i++;
		break;
	case 1:
		currentStatus = UIStatusBarStyleBlackOpaque;
		i++;
		break;
	case 2:
		isHidden = YES;	
		i++;	
		break;	
	case 3:
		isHidden = NO;
		i++;
		break;
	case 4:
		currentOrientation =  UIInterfaceOrientationPortrait;
		i++;
	case 5:
		currentOrientation = UIInterfaceOrientationLandscapeLeft;
		i = 0;
	default:
		currentStatus = UIStatusBarStyleDefault;
		i=0;
		break;
	}
	
	[[UIApplication sharedApplication] setStatusBarStyle:currentStatus animated:YES];
	[[UIApplication sharedApplication] setStatusBarHidden:isHidden withAnimation: UIUserInterfaceLayoutDirectionLeftToRight];
	[[UIApplication sharedApplication] setStatusBarOrientation:currentOrientation animated:YES];	
	NSLog(@"touched screen\n");
    CHSuper(2, UIResponder, touchesBegan, touches, withEvent, event);
}

CHConstructor {
  CHLoadLateClass(UIResponder);
	CHHook(2, UIResponder, touchesBegan, withEvent);
}


