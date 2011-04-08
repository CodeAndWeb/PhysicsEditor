//
//  UntitledAppDelegate.h
//  Untitled
//
//  Created by Andreas Low on 10.02.11.
//  Copyright --- 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface UntitledAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
