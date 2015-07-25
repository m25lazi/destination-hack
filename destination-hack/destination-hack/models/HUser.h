//
//  HUser.h
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUser : NSObject

@property (nonatomic, strong) NSString *googleId;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;

@end