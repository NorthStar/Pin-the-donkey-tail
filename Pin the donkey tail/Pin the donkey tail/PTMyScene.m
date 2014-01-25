//
//  PTMyScene.m
//  Pin the donkey tail
//
//  Created by Xinlei Xu on 1/24/14.
//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import "PTMyScene.h"

@implementation PTMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        SKSpriteNode * donk = [self Donkey];
        SKSpriteNode * hill = [self Hill];
        [self addChild: donk];
        [self addChild: hill];
        donk.scene.physicsWorld.gravity=CGVectorMake(0.0, -1.0);
        
        [self addChild:myLabel];
    }
    return self;
}

- (SKSpriteNode * ) Donkey{
    SKSpriteNode *donkey = [[SKSpriteNode alloc] initWithImageNamed:@"Donkey.jpg"]; //size:CGSizeMake(64,32)];

    donkey.physicsBody= [SKPhysicsBody bodyWithRectangleOfSize:donkey.size];
    donkey.physicsBody.affectedByGravity = TRUE;
    donkey.physicsBody.restitution = 0.8;
    
    
    SKAction *hover = [SKAction sequence:@[
                                           [SKAction moveByX:0 y:250.0 duration:0.0],
                                           [SKAction waitForDuration:0.2],
                                           
                                           [SKAction moveByX:100 y:200.0 duration:0.8],
                                           [SKAction rotateByAngle:0.1 duration:0.3],
                                           
                                           [SKAction waitForDuration:0.2],
                                           
                                           [SKAction moveByX:100 y:200.0 duration:0.8],
                                           [SKAction rotateByAngle:-0.1 duration:0.4]]];
    
    [donkey runAction: [SKAction repeatActionForever:hover]];
    

    //SKLabelNode * donkey = [UIImage imageNamed:@"Donkey.jpg"];
    return donkey;

}

- (SKSpriteNode * ) Hill{
    SKSpriteNode *hill = [[SKSpriteNode alloc] initWithImageNamed:@"Hill.jpg"]; //size:CGSizeMake(64,32)];
    
    hill.donkey.physicsBody= [SKPhysicsBody bodyWithCircleOfRadius:(100)];
    hill.physicsBody.affectedByGravity = FALSE;
    hill.physicsBody.restitution = 0.0;
    
    

    
    
    //SKLabelNode * donkey = [UIImage imageNamed:@"Donkey.jpg"];
    return hill;
    
}





-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
