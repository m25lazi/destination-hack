//
//  FollowHandler.m
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "FollowHandler.h"
#import "HUserHandler.h"
#import "HUser.h"
#import "ServerHelper.h"
#import "NSDictionary+JSON.h"

@interface FollowHandler () <NSURLConnectionDataDelegate>

@property (strong, nonatomic) completion block;

@end

@implementation FollowHandler

- (void)followUser:(NSInteger)userid completionHandler:(completion)completionHandler{
    [ServerHelper sendAsyncGetUserRequestWithUrlPath:[NSString stringWithFormat:@"/follow?uid=%ld&fid=%ld", (long)[[[HUserHandler sharedHandler] currentUser] userId], (long)userid] delegate:self];
    _block = completionHandler;
}

#pragma mark - NSURLConnectionDelegates
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSLog(@"Connection Response : %ld", (long)httpResponse.statusCode);
    if (httpResponse.statusCode != 200) {
        _block(NO);
        return;
    }
}


// This method is used to receive the data which we get using post method.
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data{
    
    NSError *error;
    NSDictionary *response = [NSDictionary dictionaryFromJsonData:data error:&error];
    if(error || ![response[@"status"] isEqualToString:@"followed"]){
        _block(NO);
        return;
    }
    _block(YES);
}


// This method receives the error report in case of connection is not made to server.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Connection failed to : %@ with error : %@", [[connection.currentRequest URL] absoluteString], error);
    _block(NO);
    
}

@end
