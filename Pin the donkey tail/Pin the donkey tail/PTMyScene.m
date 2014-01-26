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
        
        myLabel.text = @"Pin the Tail on the Donkey";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame)+200);
        
        SKSpriteNode * donk = [self Donkey];
        SKSpriteNode * hill = [self Hill];
        [self addChild: donk];
        [self addChild: hill];
        donk.scene.physicsWorld.gravity=CGVectorMake(0.0, -1.0);
        PTPinterestWrapper * pinItView = [[PTPinterestWrapper alloc]initWithFrame:CGRectMake(100, 50, 150, 50)];
        [self.view addSubview:pinItView];
        [self addChild:myLabel];
    }
    return self;
}


- (SKSpriteNode * ) Donkey{
    SKSpriteNode *donkey = [[SKSpriteNode alloc] initWithImageNamed:@"Donkey.jpg"]; //size:CGSizeMake(64,32)];

    donkey.physicsBody= [SKPhysicsBody bodyWithRectangleOfSize:donkey.size];
    donkey.physicsBody.affectedByGravity = TRUE;
    donkey.physicsBody.restitution = 0.8;
    donkey.physicsBody.mass=1;
    donkey.position=CGPointMake(0, 400);
    
    
    SKAction *hover = [SKAction sequence:@[
    
                                           [SKAction waitForDuration:0.2],
                                           
                                           [SKAction moveByX:120 y:0 duration:0.8],
                                           [SKAction rotateByAngle:0.2 duration:0.4],
                                           
                                           [SKAction waitForDuration:0.2],
                                           
                                           [SKAction moveByX:120 y:0 duration:0.8],
                                           [SKAction rotateByAngle:-0.2 duration:4]]];
    
    [donkey runAction: [SKAction repeatActionForever:hover]];
    

    //SKLabelNode * donkey = [UIImage imageNamed:@"Donkey.jpg"];
    return donkey;

}

- (SKSpriteNode * ) Hill{
    SKSpriteNode *hill = [[SKSpriteNode alloc] initWithImageNamed:@"Hill.jpg"]; //size:CGSizeMake(64,32)];
    hill.size  = CGSizeMake(800, 200);
    hill.position=CGPointMake(400, 150);
    hill.physicsBody= [SKPhysicsBody bodyWithRectangleOfSize:hill.size];
    //hill  = CGRectMake(0, 0, 400, 200);
    hill.physicsBody.affectedByGravity = FALSE;
    hill.physicsBody.restitution = 0.0;
    hill.physicsBody.mass=1000000000;
    
    
    

    
    
    //SKLabelNode * donkey = [UIImage imageNamed:@"Donkey.jpg"];
    return hill;
    
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    //[self runAction: self.buttonPressAnimation];
    for (UITouch * touch in touches)
    {
        if ([touch locationInNode:self].x > 0)
        {
                SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
    
                self.nextScene = [[PTScrambleScene alloc] initWithSize: CGSizeMake(1024,768)];
    
                //  Optionally, insert code to configure the new scene.
    
                [self.scene.view presentScene: self.nextScene transition: reveal];
        }
    }
    /*for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }*/
}


@end
