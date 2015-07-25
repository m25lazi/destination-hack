//
//  WindowHandler.m
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "WindowHandler.h"

@implementation WindowHandler

+ (id)sharedHandler {
    static WindowHandler *sharedHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHandler = [[self alloc] init];
    });
    return sharedHandler;
}

- (void)showMainFeed{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyBoard instantiateInitialViewController];
    [self.delegate.window setRootViewController:vc];
}

@end
