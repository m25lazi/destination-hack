//
//  FeedHandler.m
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "FeedHandler.h"
#import "HReview.h"
#import "ServerHelper.h"
#import "NSDictionary+JSON.h"

typedef void(^feedCompletion)(NSArray *reviews, BOOL success);

@interface FeedHandler ()<NSURLConnectionDataDelegate>

@property (strong, nonatomic) feedCompletion block;

@end

@implementation FeedHandler

- (void)getFeedsWithCompletionHandler:(feedCompletion)completionBlock{
    
    [ServerHelper sendAsyncGetUserRequestWithUrlPath:@"/feed" delegate:self];
    _block = completionBlock;
}

#pragma mark - NSURLConnectionDelegates
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSLog(@"Connection Response : %ld", (long)httpResponse.statusCode);
    if (httpResponse.statusCode != 200) {
        _block(nil, NO);
        return;
    }
}


// This method is used to receive the data which we get using post method.
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data{
    
    NSError *error;
    NSDictionary *response = [NSDictionary dictionaryFromJsonData:data error:&error];
    if(error){
        _block(nil, NO);
        return;
    }
    
    //parse data
    NSMutableArray *reviews = [[NSMutableArray alloc] init];
    NSArray *reviewDictArray = response[@"reviews"];
    for (NSDictionary *reviewDict in reviewDictArray) {
        [reviews addObject:[HReview reviewFromDictionary:reviewDict]];
    }
    
    _block([NSArray arrayWithArray:reviews], YES);
}


// This method receives the error report in case of connection is not made to server.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Connection failed to : %@ with error : %@", [[connection.currentRequest URL] absoluteString], error);
    _block(nil, NO);
    
}

@end
