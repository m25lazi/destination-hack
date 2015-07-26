//
//  UserSearch.h
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^completion)(NSArray *users, BOOL success);

@interface UserSearch : NSObject

- (void)searchFor:(NSString *)userKeyword completionHandler:(completion)completionBlock;

@end
