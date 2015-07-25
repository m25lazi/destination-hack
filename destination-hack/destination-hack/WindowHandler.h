//
//  WindowHandler.h
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface WindowHandler : NSObject

@property (strong, nonatomic) AppDelegate *delegate;

+ (id)sharedHandler;
- (void)showMainFeed;

@end
