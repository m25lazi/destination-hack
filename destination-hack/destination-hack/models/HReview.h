//
//  HReview.h
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HReview : NSObject

@property (nonatomic) NSInteger uniqueId;
@property (nonatomic) NSInteger placeId;
@property (nonatomic) NSInteger rating;
@property (strong, nonatomic) NSString *details;
@property (strong, nonatomic) NSArray *images;

+ (HReview *)reviewFromDictionary:(NSDictionary *)info;

- (void)postWithDelegate:(id)delegate;

@end
