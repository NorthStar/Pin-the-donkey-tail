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
@property NSMutableArray * copyArray;
@property NSMutableArray * choices;
@property UIImage * imageToScramble;
@property UIImage * image1;
@property UIImage * image2;
@property UIImage * image3;
@property UIImage * image4;
@end

@implementation PTScrambleScene
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        int width=3;
        int height=3;
        int scramble = 100;
        int startX=200;
        int startY=400;
        int space=60;
        
        int whiteSquareX = 0;
        int whiteSquareY = 0;
        
        NSMutableArray * arrayOfIcons = [[NSMutableArray alloc] initWithCapacity:width];
        NSMutableArray * copyArray = [[NSMutableArray alloc] initWithCapacity:width];
        [self.arrayOfIcons addObject:[[NSMutableArray alloc] initWithCapacity:height]];
        for (int i = 0; i < width; ++i){
            for (int j = 0; j < height; ++j){
                if (!(i==whiteSquareX && j==whiteSquareY)){ //leave on empty square
                    [[self.arrayOfIcons objectAtIndex:i] insertObject:[[SKSpriteNode alloc] initWithImageNamed:@"Donkey.jpg"] atIndex:j]; //some image
                    [[self.copyArray objectAtIndex:i] insertObject:[[SKSpriteNode alloc] initWithImageNamed:@"Donkey.jpg"] atIndex:j]; //some image
                }
            }
        }
        
        NSMutableArray * choices = [[NSMutableArray alloc] init];
        for (int i = 0; i < scramble; ++i){
            self.choices = [[NSMutableArray alloc] init];
            if (whiteSquareX > 0)
                [choices addObject:[NSNumber numberWithInt:0]];
            if (whiteSquareX < width)
                [choices addObject:[NSNumber numberWithInt:1]];
            if (whiteSquareY > 0)
                [choices addObject:[NSNumber numberWithInt:2]];
            if (whiteSquareY < height)
                [choices addObject:[NSNumber numberWithInt:3]];
            int k=(arc4random()* [self.choices );
            SKSpriteNode * temp=[[self.arrayOfIcons objectAtIndex:whiteSquareX] objectAtIndex:whiteSquareY];
            if (k==0){
                [[self.arrayOfIcons objectAtIndex:whiteSquareX] insertObject:[[self.arrayOfIcons objectAtIndex:whiteSquareX-1] objectAtIndex:whiteSquareY] atIndex:whiteSquareY];
                [[self.arrayOfIcons objectAtIndex:whiteSquareX-1] insertObject:temp atIndex:whiteSquareY];
            }
            if (k==1){
                [[self.arrayOfIcons objectAtIndex:whiteSquareX] insertObject:[[self.arrayOfIcons objectAtIndex:whiteSquareX+1] objectAtIndex:whiteSquareY] atIndex:whiteSquareY];
                [[self.arrayOfIcons objectAtIndex:whiteSquareX+1] insertObject:temp atIndex:whiteSquareY];
            }
            if (k==2){
                [[self.arrayOfIcons objectAtIndex:whiteSquareX] insertObject:[[self.arrayOfIcons objectAtIndex:whiteSquareX] objectAtIndex:whiteSquareY-1] atIndex:whiteSquareY];
                [[self.arrayOfIcons objectAtIndex:whiteSquareX] insertObject:temp atIndex:whiteSquareY-1];
            }
            if (k==3){
                [[self.arrayOfIcons objectAtIndex:whiteSquareX] insertObject:[[self.arrayOfIcons objectAtIndex:whiteSquareX] objectAtIndex:whiteSquareY+1] atIndex:whiteSquareY];
                [[self.arrayOfIcons objectAtIndex:whiteSquareX] insertObject:temp atIndex:whiteSquareY+1];
            }
        }
        
        for (int i =0; i < width; ++i){
            for (int j = 0; j < height; ++j){
                [[self.arrayOfIcons objectAtIndex:i] objectAtIndex:j] setFrame: = CGsizeMake(50,50);
                [[self.arrayOfIcons objectAtIndex:i] objectAtIndex:j].center = CGPointMake(startX+space*i, startY+space*j);
            }
        }
        
        BOOL done=FALSE;
        while (!done){
            
        }
        
        
    }
    return self;
}
@end
