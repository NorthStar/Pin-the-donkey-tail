//
//  PTClient.h
//  Pin the donkey tail
//
//  Created by Xinlei Xu on 1/25/14.
//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTPinterestWrapper.h"
@interface PTClient : NSObject

@property (atomic, strong) NSString * clientID;
@property (atomic, strong) NSString * clientSecret;
@property (atomic, strong) NSString * accessToken;

-(void) initWithClientID:(NSString *) clientID andSecret: (NSString *) clientSecret;

-(void) authenticateWithAccessToken: (NSString *) accessToken;

@end
