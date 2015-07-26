//
//  ServerHelper.m
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "NSDictionary+JSON.h"
#import "ServerHelper.h"
#import "HUserHandler.h"
#import "defaults.h"

@implementation ServerHelper

+ (void)sendAsyncPostUserRequestWithUrlPath:(NSString *)path bodyInfo:(NSDictionary *)info delegate:(id)delegate{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kHackServerUrl, path]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:info];
    [dictionary setObject:[NSNumber numberWithInteger:[[[HUserHandler sharedHandler] currentUser] userId]] forKey:@"uid"];
    NSError *error;
    NSData *jsonData = [dictionary jsonData:&error];
    
    if(error){
        NSLog(@"JSON Error");
        return;
    }
    [urlRequest setHTTPBody:jsonData];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:delegate startImmediately:YES];
    if(connection){
        NSLog(@"Request sent : %@", [url absoluteString]);
    }

}

+ (void)sendAsyncGetUserRequestWithUrlPath:(NSString *)path delegate:(id)delegate{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kHackServerUrl, path]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"GET"];
    
    
    //NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:info];
    //[dictionary setObject:[NSNumber numberWithInteger:[[[HUserHandler sharedHandler] currentUser] userId]] forKey:@"uid"];
    NSError *error;
    //NSData *jsonData = [dictionary jsonData:&error];
    
    if(error){
        NSLog(@"JSON Error");
        return;
    }
    //[urlRequest setHTTPBody:jsonData];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:delegate startImmediately:YES];
    if(connection){
        NSLog(@"Request sent : %@", [url absoluteString]);
    }
    
}

@end
