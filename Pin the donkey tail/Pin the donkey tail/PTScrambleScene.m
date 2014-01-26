//
//  PTScrambleScene.m
//  Pin the donkey tail
//
//  Created by Xinlei Xu on 1/25/14.
//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import "PTScrambleScene.h"
//Hacky way to load somewhat evenly -- use a random number generator
#import <stdlib.h>


@interface PTScrambleScene()
@property NSMutableArray * arrayOfIcons;
@property NSMutableArray * anArray;
@property NSMutableArray * choices;
@property int whiteSquareX;
@property int whiteSquareY;
@property int startX;
@property int startY;
@property int squareSize;
@property int width;
@property int height;
@property int space;
@property int lowStartX;
@property int lowStartY;
@property int smallSpace;
@property int smallSquareSize;
@property UIImage * imageToScramble;
@property UIImage * image1;
@property UIImage * image2;
@property UIImage * image3;
@property UIImage * image4;
@end

@implementation PTScrambleScene
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.width=3;
        self.height=3;
        int scramble = 100;
        self.startX=200;
        self.startY=100;
        self.space=180;
        self.squareSize=150;
        
        
        self.whiteSquareX = 0;
        self.whiteSquareY = 0;
        
        self.arrayOfIcons = [[NSMutableArray alloc] initWithCapacity:self.width];
        self.anArray = [[NSMutableArray alloc] initWithCapacity:self.width];
        [self.arrayOfIcons addObject:[[NSMutableArray alloc] initWithCapacity:self.height]];
        for (int i = 0; i < self.width; ++i){
            [self.arrayOfIcons addObject:[[NSMutableArray alloc] init]];
            [self.anArray addObject:[[NSMutableArray alloc] init]];
            for (int j = 0; j < self.height; ++j){
                if (!(i
                      ==self.whiteSquareX && j==self.whiteSquareY)){ //leave on empty square
                    [[self.arrayOfIcons objectAtIndex:i] addObject:[[SKSpriteNode alloc] initWithImageNamed:@"Donkey.jpg"]]; //some image
                    [[self.anArray objectAtIndex:i] addObject:[[SKSpriteNode alloc] initWithImageNamed:@"Donkey.jpg"]]; //some image
                }
                else{
                    [[self.arrayOfIcons objectAtIndex:i] addObject:[[SKSpriteNode alloc] initWithColor:[UIColor blackColor]  size:CGSizeMake(self.squareSize, self.squareSize)]]; //some image
                    [[self.anArray objectAtIndex:i] addObject:[[SKSpriteNode alloc] initWithColor:[UIColor blackColor] size:CGSizeMake(self.squareSize, self.squareSize)]]; //some image
                }
            }
        }
        
        self.choices = [[NSMutableArray alloc] init];
        for (int i = 0; i < scramble; ++i){
            self.choices = [[NSMutableArray alloc] init];
            if (self.whiteSquareX > 0)
                [self.choices addObject:[NSNumber numberWithInt:0]];
            if (self.whiteSquareX < self.width-1)
                [self.choices addObject:[NSNumber numberWithInt:1]];
            if (self.whiteSquareY > 0)
                [self.choices addObject:[NSNumber numberWithInt:2]];
            if (self.whiteSquareY < self.height-1)
                [self.choices addObject:[NSNumber numberWithInt:3]];
            int j =arc4random()% [self.choices count];
            int k = [[self.choices objectAtIndex:j] intValue];
            SKSpriteNode * temp=[[self.arrayOfIcons objectAtIndex:self.whiteSquareX] objectAtIndex:self.whiteSquareY];
            if (k==0){
                [[self.arrayOfIcons objectAtIndex:self.whiteSquareX] replaceObjectAtIndex:self.whiteSquareY withObject:[[self.arrayOfIcons objectAtIndex:self.whiteSquareX-1] objectAtIndex:self.whiteSquareY]];
                [[self.arrayOfIcons objectAtIndex:self.whiteSquareX-1] replaceObjectAtIndex:self.whiteSquareY withObject:temp];
                self.whiteSquareX--;
            }
            if (k==1){
                [[self.arrayOfIcons objectAtIndex:self.whiteSquareX] replaceObjectAtIndex:self.whiteSquareY withObject:[[self.arrayOfIcons objectAtIndex:self.whiteSquareX+1] objectAtIndex:self.whiteSquareY]];
                [[self.arrayOfIcons objectAtIndex:self.whiteSquareX+1] replaceObjectAtIndex:self.whiteSquareY withObject:temp];
                self.whiteSquareX++;
            }
            if (k==2){
                [[self.arrayOfIcons objectAtIndex:self.whiteSquareX] replaceObjectAtIndex:self.whiteSquareY withObject:[[self.arrayOfIcons objectAtIndex:self.whiteSquareX] objectAtIndex:self.whiteSquareY-1] ];
                [[self.arrayOfIcons objectAtIndex:self.whiteSquareX] replaceObjectAtIndex:self.whiteSquareY-1 withObject:temp];
                self.whiteSquareY--;
            }
            if (k==3){
                [[self.arrayOfIcons objectAtIndex:self.whiteSquareX] replaceObjectAtIndex:self.whiteSquareY withObject:[[self.arrayOfIcons objectAtIndex:self.whiteSquareX] objectAtIndex:self.whiteSquareY+1]];
                [[self.arrayOfIcons objectAtIndex:self.whiteSquareX] replaceObjectAtIndex:self.whiteSquareY+1 withObject:temp];
                self.whiteSquareY++;
            }
        }
        
        for (int i =0; i < self.width; ++i){
            for (int j = 0; j < self.height; ++j){
                SKSpriteNode * temp =[[self.arrayOfIcons objectAtIndex:i] objectAtIndex:j];
                if (!(i==self.whiteSquareX&&j==self.whiteSquareY)){
                    temp.xScale=self.squareSize/temp.size.width;
                    temp.yScale=self.squareSize/temp.size.height;
                }
                temp.position = CGPointMake(self.startX+i*self.space, self.startY+j*self.space);
                [self addChild:temp];
                
                SKSpriteNode * temp2 =[[self.anr objectAtIndex:i] objectAtIndex:j];
                if (!(i==self.whiteSquareX&&j==self.whiteSquareY)){
                    temp.xScale=self.squareSize/temp.size.width;
                    temp.yScale=self.squareSize/temp.size.height;
                }
                temp.position = CGPointMake(self.startX+i*self.space, self.startY+j*self.space);
                [self addChild:temp];
                //nil out temp here
                /*\FIXME*/
            }
        }
        
        
        
    }
    return self;
}


-(void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *) event{
    UITouch *myTouch = [[touches allObjects] objectAtIndex:0];
    CGPoint mousePos = [myTouch locationInView: self.view];
    //Somehow let mousePos=clicked position if clicked
    SKSpriteNode * whiteSquare=[[self.arrayOfIcons objectAtIndex:self.whiteSquareX] objectAtIndex:self.whiteSquareY];
    SKSpriteNode * swapped;
    
    if (self.whiteSquareX>0 &&
        CGRectContainsPoint( CGRectMake(self.startX+(self.whiteSquareX-1)*self.space, self.startY+self.whiteSquareY*self.space, self.squareSize, self.squareSize),mousePos)){
        swapped =[[self.arrayOfIcons objectAtIndex:self.whiteSquareX-1] objectAtIndex:self.whiteSquareY];
        
        [[self.arrayOfIcons objectAtIndex:self.whiteSquareX] replaceObjectAtIndex:self.whiteSquareY withObject:swapped];
        [[self.arrayOfIcons objectAtIndex:self.whiteSquareX-1] replaceObjectAtIndex:self.whiteSquareY withObject:whiteSquare];
        
        [swapped runAction:[SKAction moveByX:self.squareSize y:0 duration:0.5]];
        [whiteSquare runAction:[SKAction moveByX:-self.squareSize y:0 duration:0.5]];
        self.whiteSquareX--;
        
    }
    if (self.whiteSquareX<self.width-1 &&
        CGRectContainsPoint( CGRectMake(self.startX+(self.whiteSquareX+1)*self.space, self.startY+self.whiteSquareY*self.space, self.squareSize, self.squareSize),mousePos)){
        swapped =[[self.arrayOfIcons objectAtIndex:self.whiteSquareX+1] objectAtIndex:self.whiteSquareY];
        
        [[self.arrayOfIcons objectAtIndex:self.whiteSquareX] replaceObjectAtIndex:self.whiteSquareY withObject:swapped];
        [[self.arrayOfIcons objectAtIndex:self.whiteSquareX+1] replaceObjectAtIndex:self.whiteSquareY withObject:whiteSquare];
        
        [swapped runAction:[SKAction moveByX:-self.squareSize y:0 duration:0.5]];
        [whiteSquare runAction:[SKAction moveByX:self.squareSize y:0 duration:0.5]];
        self.whiteSquareX++;
        
    }
    if (self.whiteSquareY>0 &&
        CGRectContainsPoint( CGRectMake(self.startX+self.whiteSquareX*self.space, self.startY+(self.whiteSquareY-1)*self.space, self.squareSize, self.squareSize),mousePos)){
        swapped =[[self.arrayOfIcons objectAtIndex:self.whiteSquareX] objectAtIndex:self.whiteSquareY-1];
        
        [[self.arrayOfIcons objectAtIndex:self.whiteSquareX] replaceObjectAtIndex:self.whiteSquareY withObject:swapped];
        [[self.arrayOfIcons objectAtIndex:self.whiteSquareX] replaceObjectAtIndex:self.whiteSquareY-1 withObject:whiteSquare];
        
        [swapped runAction:[SKAction moveByX:0 y:self.squareSize duration:0.5]];
        [whiteSquare runAction:[SKAction moveByX:0 y:-self.squareSize duration:0.5]];
        self.whiteSquareY--;
    }
    if (self.whiteSquareY<self.height-1 &&
        CGRectContainsPoint( CGRectMake(self.startX+self.whiteSquareX*self.space, self.startY+(self.whiteSquareY+1)*self.space, self.squareSize, self.squareSize),mousePos)){
        swapped =[[self.arrayOfIcons objectAtIndex:self.whiteSquareX] objectAtIndex:self.whiteSquareY+1];
        
        [[self.arrayOfIcons objectAtIndex:self.whiteSquareX] replaceObjectAtIndex:self.whiteSquareY withObject:swapped ];
        [[self.arrayOfIcons objectAtIndex:self.whiteSquareX] replaceObjectAtIndex:self.whiteSquareY+1 withObject:whiteSquare];
        
        [swapped runAction:[SKAction moveByX:0 y:-self.squareSize duration:0.5]];
        [whiteSquare runAction:[SKAction moveByX:0 y:self.squareSize duration:0.5]];
        self.whiteSquareY++;
    }
}


@end
