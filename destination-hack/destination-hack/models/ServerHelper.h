//
//  ServerHelper.h
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerHelper : NSObject

+ (void)sendAsyncPostUserRequestWithUrlPath:(NSString *)path bodyInfo:(NSDictionary *)info delegate:(id)delegate;
+ (void)sendAsyncGetUserRequestWithUrlPath:(NSString *)path delegate:(id)delegate;

@end
