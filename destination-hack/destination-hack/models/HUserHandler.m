//
//  HUserHandler.m
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "HUserHandler.h"

@implementation HUserHandler

+ (id)sharedHandler {
    static HUserHandler *sharedHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHandler = [[self alloc] init];
        sharedHandler.currentUser = [[HUser alloc] init];
    });
    return sharedHandler;
}

@end
