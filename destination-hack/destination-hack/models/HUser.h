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
@property (nonatomic) NSInteger userId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic) BOOL follows;
@property (nonatomic) BOOL following;

@end
