//
//  PTMyScene.h
//  Pin the donkey tail
//

//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "PTScrambleScene.h"
#import "PTPinterestWrapper.h"
#import "PT.h"
@interface PTMyScene : SKScene
@property PTScrambleScene * nextScene;
@property(atomic, strong) NSMutableArray * imageViewArray;

@end
