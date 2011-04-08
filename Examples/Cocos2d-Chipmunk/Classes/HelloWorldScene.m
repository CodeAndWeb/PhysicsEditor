//
//  HelloWorldScene.m
//  Cocos2d-Chipmunk
//
//  Created by Andreas Low on 28.02.11.
//  Copyright codeandweb.de 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldScene.h"
#import "GCpShapeCache.h"

enum {
	kTagBatchNode = 1,
};

static void eachShape(void *ptr, void* unused)
{
	cpShape *shape = (cpShape*) ptr;
    cpBody *body = shape->body;

	CCSprite *sprite = body->data;
	if( sprite )
    {
		[sprite setPosition: body->p];		
		[sprite setRotation: (float) CC_RADIANS_TO_DEGREES( -body->a )];
	}
}

// HelloWorld implementation
@implementation HelloWorld

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorld *layer = [HelloWorld node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


NSString *names[] = {
    @"hotdog",
    @"drink",
    @"icecream",
    @"icecream2",
    @"icecream3",
    @"hamburger"
};

-(void) addNewSprite: (float)x y:(float)y
{    
    NSString *name = names[rand()%6];
    
    // create and add sprite
	CCSprite *sprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@.png", name]];
	[self addChild:sprite];

    // set anchor point
    sprite.anchorPoint = [[GCpShapeCache sharedShapeCache] anchorPointForShape:name];
    	
    // create physics shape
    cpBody *body = [[GCpShapeCache sharedShapeCache] createBodyWithName:name inSpace:space withData:sprite];

    // set position
    body->p = ccp(x,y);
}

-(id) init
{
	if( (self=[super init])) {
		
		self.isTouchEnabled = YES;
		self.isAccelerometerEnabled = YES;
		
		CGSize wins = [[CCDirector sharedDirector] winSize];
		cpInitChipmunk();
		
		cpBody *staticBody = cpBodyNew(INFINITY, INFINITY);
		space = cpSpaceNew();
		cpSpaceResizeStaticHash(space, 400.0f, 40);
		cpSpaceResizeActiveHash(space, 100, 600);
		
		space->gravity = ccp(0, 0);
		space->elasticIterations = space->iterations;
		
		cpShape *shape;
		
		// bottom
		shape = cpSegmentShapeNew(staticBody, ccp(0,0), ccp(wins.width,0), 0.0f);
		shape->e = 1.0f; shape->u = 1.0f;
		cpSpaceAddStaticShape(space, shape);
		
		// top
		shape = cpSegmentShapeNew(staticBody, ccp(0,wins.height), ccp(wins.width,wins.height), 0.0f);
		shape->e = 1.0f; shape->u = 1.0f;
		cpSpaceAddStaticShape(space, shape);
		
		// left
		shape = cpSegmentShapeNew(staticBody, ccp(0,0), ccp(0,wins.height), 0.0f);
		shape->e = 1.0f; shape->u = 1.0f;
		cpSpaceAddStaticShape(space, shape);
		
		// right
		shape = cpSegmentShapeNew(staticBody, ccp(wins.width,0), ccp(wins.width,wins.height), 0.0f);
		shape->e = 1.0f; shape->u = 1.0f;
		cpSpaceAddStaticShape(space, shape);
		
        // load physics data
        [[GCpShapeCache sharedShapeCache] addShapesWithFile:@"shapedefs.plist"];
        		
		[self addNewSprite: 200 y:200];
		
		[self schedule: @selector(step:)];
	}
	
	return self;
}

-(void) onEnter
{
	[super onEnter];
	
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0 / 60)];
}

-(void) step: (ccTime) delta
{
	int steps = 2;
	CGFloat dt = delta/(CGFloat)steps;
	
	for(int i=0; i<steps; i++){
		cpSpaceStep(space, dt);
	}
	cpSpaceHashEach(space->activeShapes, &eachShape, nil);
	cpSpaceHashEach(space->staticShapes, &eachShape, nil);
}


- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		
		location = [[CCDirector sharedDirector] convertToGL: location];
		
		[self addNewSprite: location.x y:location.y];
	}
}

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{	
	static float prevX=0, prevY=0;
	
#define kFilterFactor 0.05f
	
	float accelX = (float) acceleration.x * kFilterFactor + (1- kFilterFactor)*prevX;
	float accelY = (float) acceleration.y * kFilterFactor + (1- kFilterFactor)*prevY;
	
	prevX = accelX;
	prevY = accelY;
	
	CGPoint v = ccp( -accelY, accelX );
	
	space->gravity = ccpMult(v, 200);
}
@end
