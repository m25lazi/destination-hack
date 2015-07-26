//
//  FollowHandler.h
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^completion)(BOOL success);

@interface FollowHandler : NSObject

- (void)followUser:(NSInteger)userid completionHandler:(completion)completionHandler;

@end
