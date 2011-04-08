//
//  Cocos2d_ChipmunkAppDelegate.h
//  Cocos2d-Chipmunk
//
//  Created by Andreas Low on 28.02.11.
//  Copyright codeandweb.de 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface Cocos2d_ChipmunkAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
