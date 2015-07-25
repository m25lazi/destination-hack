//
//  HUserHandler.h
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HUser.h"

@interface HUserHandler : NSObject

@property (strong, nonatomic) HUser *currentUser;

+ (id)sharedHandler;

@end
