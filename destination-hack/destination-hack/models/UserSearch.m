//
//  UserSearch.m
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "UserSearch.h"
#import "HUserHandler.h"
#import "HUser.h"
#import "ServerHelper.h"
#import "NSDictionary+JSON.h"

@interface UserSearch () <NSURLConnectionDataDelegate>

@property (strong, nonatomic) completion block;

@end

@implementation UserSearch

- (void)searchFor:(NSString *)userKeyword completionHandler:(completion)completionBlock{
    [ServerHelper sendAsyncGetUserRequestWithUrlPath:[NSString stringWithFormat:@"/search_users?name=%@&uid=%ld", userKeyword, (long)[[[HUserHandler sharedHandler] currentUser] userId]] delegate:self];
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
    NSMutableArray *users = [[NSMutableArray alloc] init];
    NSArray *userArrayDict = response[@"search_results"];
    if (!userArrayDict) {
        _block(nil, YES);
        return;
    }
    for (NSDictionary *userDetailsDict in userArrayDict) {
        HUser *user = [[HUser alloc] init];
        NSArray *userDetailsArray = userDetailsDict[@"user"];
        [user setUserId:[[userDetailsArray objectAtIndex:0] integerValue]];
        [user setGoogleId:[userDetailsArray objectAtIndex:1]];
        [user setName:[userDetailsArray objectAtIndex:2]];
        [user setEmail:[userDetailsArray objectAtIndex:3]];
        
        [user setFollows:[userDetailsDict[@"follows"] boolValue]];
        [user setFollowing:[userDetailsDict[@"following"] boolValue]];
        
        [users addObject:user];
    }
    
    _block([NSArray arrayWithArray:users], YES);
}


// This method receives the error report in case of connection is not made to server.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Connection failed to : %@ with error : %@", [[connection.currentRequest URL] absoluteString], error);
    _block(nil, NO);
    
}

@end
