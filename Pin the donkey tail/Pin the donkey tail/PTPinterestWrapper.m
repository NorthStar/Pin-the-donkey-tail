//
//  PTPinterestWrapper.m
//  Pin the donkey tail
//
//  Created by Xinlei Xu on 1/25/14.
//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import "PTPinterestWrapper.h"
#define kMargin             20.0
#define kSampleImageWidth   320.0
#define kSampleImageHeight  200.0

#define kPinItButtonWidth   72.0
#define kPinItButtonHeight  32.0

@implementation PTPinterestWrapper

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialize a Pinterest instance with our client_id
        
        _pinterest = [[Pinterest alloc] initWithClientId:@"" urlSchemeSuffix:@"prod"];
        
        NSString * description = nil;
        UILabel * titleLabel = nil;
        CGFloat centerX = CGRectGetMidX(self.frame);
        // Setup Title Label
        if (description){
        UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [titleLabel setText:@"Pinterest Pin It Demo"];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [titleLabel sizeToFit];
        [titleLabel setFrame:CGRectMake(centerX - CGRectGetWidth(titleLabel.frame)/2,
                                        kMargin,
                                        CGRectGetWidth(titleLabel.frame),
                                        CGRectGetHeight(titleLabel.frame))];
            [self addSubview:titleLabel];}
        
        //Initialize from the url string
        NSURL* aURL = [NSURL URLWithString:self.stringURL];
        NSData* data = [[NSData alloc] initWithContentsOfURL:aURL];
        UIImage* anImage = [UIImage imageWithData:data];
        UIImageView* anImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [anImageView setImage:anImage];
        if (titleLabel){
            [anImageView setFrame:CGRectMake(centerX - kSampleImageWidth/2,
                                             CGRectGetMaxY(titleLabel.frame) + kMargin,
                                             kSampleImageWidth,
                                             kSampleImageHeight)];
        }
        else {
            [anImageView setFrame:CGRectMake(centerX - kSampleImageWidth/2,
                                             0,
                                             kSampleImageWidth,
                                             kSampleImageHeight)];
        }
        [self addSubview:anImageView];

        
        // Pin it button
        UIButton* pinItButton = [Pinterest pinItButton];
        /*position
         */
        [pinItButton setFrame:CGRectMake(centerX - kPinItButtonWidth/2,
         CGRectGetMaxY(anImageView.frame) + kMargin,
         kPinItButtonWidth,
         kPinItButtonHeight)];

        [pinItButton addTarget:self
                        action:@selector(pinIt:)
              forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:pinItButton];
    }
    return self;
}


#pragma mark PinIt Method
- (void)pinIt:(id)sender{
    NSURL * _imageURL= [NSURL URLWithString:self.stringURL];
    NSURL * _sourceURL = [NSURL URLWithString:[_imageURL host]];
    
    [_pinterest createPinWithImageURL:_imageURL
                            sourceURL: _sourceURL
                          description:_description];
}



// (NSDictionary *)fetchDonkeyPhotos{
    
//}

- (void) fetchDonkeyPhotos:(NSMutableDictionary *)data
{
    NSMutableArray *photos = [data objectForKey:@"data"];
    
    NSLog(@"%@",[[[[[data objectForKey:@"data"] objectAtIndex:0] objectForKey:@"images"] objectForKey:@"low_resolution"] objectForKey:@"url"]);
    /*    for (UIView *subView in [self.searchResultsBox subviews]) {
        [subView removeFromSuperview];
    }
    
    [self.searchResultsBox setContentSize:CGSizeMake(320, 100*[photos count])];
    */
    int i = 0;
    
    for (NSMutableDictionary *photo in photos) {
        INETImageView* temp = [[INETImageView alloc] initWithURL:[NSURL URLWithString:[[[photo objectForKey:@"images"] objectForKey:@"low_resolution"] objectForKey:@"url"]] andFrame:CGRectMake(0, 100 * i, 100, 100)];
        
        //Not displaying anything yet
        //[self.searchResultsBox addSubview:temp];
        
        ++i;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
