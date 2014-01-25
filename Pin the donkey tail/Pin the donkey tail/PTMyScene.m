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
        
        [self addChild: [self Donkey]];
        
        [self addChild:myLabel];
    }
    return self;
}

- (SKSpriteNode * ) Donkey{
    SKSpriteNode *donkey = [[SKSpriteNode alloc] initWithImageNamed:@"Donkey.jpg"]; //size:CGSizeMake(64,32)];
    
    
    
    SKAction *hover = [SKAction sequence:@[
                                           
                                           [SKAction waitForDuration:0.3],
                                           
                                           [SKAction moveByX:100 y:50.0 duration:0.8],
                                           [SKAction rotateByAngle:0.1 duration:0.3],
                                           
                                           [SKAction waitForDuration:0.3],
                                           
                                           [SKAction moveByX:100 y:50.0 duration:0.8],
                                           [SKAction rotateByAngle:-0.1 duration:0.4]]];
    
    [donkey runAction: [SKAction repeatActionForever:hover]];
    

    //SKLabelNode * donkey = [UIImage imageNamed:@"Donkey.jpg"];
    return donkey;

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
