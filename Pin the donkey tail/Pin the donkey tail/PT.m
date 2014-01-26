//
//  PT.m
//  Pin the donkey tail
//
//  Created by Xinlei Xu on 1/25/14.
//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import "PT.h"

@implementation PT

- (id) initWithTagQuery:(NSString *)query andTarget:(id)incomingTarget andAction:(SEL)incomingAction
{
    self = [super init];
    if (self) {
        

        /*https://api.pinterest.com/v3/search/pins/?query=donkeys&page_size=25&client_id=1435791&timestamp=1390674537047&oauth_signature=dbb218731dc6c0bd8c394185f1a82d6011e9ddab3871628d4ebcb3afaad79f12         
         *\FIXME: This should not be visible
         *\TODO:  This should be up to date, accepting multiple queries and everything. But here I am quite hacky.
         */
        NSString * urlString = [PTClient fetchPinterestAPIURLFromQuery: query];
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];

                                  self.connection = [[NSURLConnection alloc] initWithRequest: request delegate:self];

                           //[NSURL URLWithString:[NSString stringWithFormat:@"https://api.pinterest.com/v3/search/pins/?query=%@donkeys&page_size=25&client_id=1435791&timestamp=1390674537047&oauth_signature=dbb218731dc6c0bd8c394185f1a82d6011e9ddab3871628d4ebcb3afaad79f12", query]]] delegate:self];
        
        /*self.connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.instagram.com/v1/tags/%@/media/recent?client_id=52b557afb1c64d5aa7480bef6c368f3e", query]]] delegate:self];*/
        
        
        
        
        self.target = incomingTarget;
        self.action = incomingAction;
    }
    return self;
}
     - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.data = [[NSMutableData alloc] initWithCapacity:0];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSMutableDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:nil];
    
    [self.target performSelector:self.action withObject:dictionary];
    
    
}

@end
