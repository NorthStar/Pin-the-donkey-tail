//
//  PTPinterestWrapper.h
//  Pin the donkey tail
//
//  Created by Xinlei Xu on 1/25/14.
//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Pinterest/Pinterest.h>
@interface PTPinterestWrapper : UIView
{
    Pinterest *  _pinterest;
    
    //NSURL * _sourceURL;
    //NSURL * _imageURL;
    NSString * _description;
}

@property (atomic, strong) NSString * stringURL;
- (void)pinIt:(id)sender;
@end
