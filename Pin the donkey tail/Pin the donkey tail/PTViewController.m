//
//  PTViewController.m
//  Pin the donkey tail
//
//  Created by Xinlei Xu on 1/24/14.
//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import "PTViewController.h"
#import "PTMyScene.h"
//Pinterest stuff
#import <Pinterest/Pinterest.h>
@interface PTViewController ()
{
    Pinterest*  _pinterest;
}
@end

@implementation PTViewController

- (void)viewDidLoad
{
    // Configure the view.
    [super viewDidLoad];

    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [PTMyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
    
}
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}




@end
