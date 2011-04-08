//
//  HelloWorldScene.m
//  Cocos2d-Chipmunk
//
//  Created by Andreas Low on 28.02.11.
//  Copyright codeandweb.de 2011. All rights reserved.
//

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// Importing Chipmunk headers
#import "chipmunk.h"

// HelloWorld Layer
@interface HelloWorld : CCLayer
{
	cpSpace *space;
}

// returns a Scene that contains the HelloWorld as the only child
+(id) scene;
-(void) step: (ccTime) dt;
-(void) addNewSprite:(float)x y:(float)y;

@end
