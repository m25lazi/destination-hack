//
//  HReview.m
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "HReview.h"
#import "ServerHelper.h"

@implementation HReview

- (void)postWithDelegate:(id)delegate{
    NSDictionary *dictionary = [self dictionary];
    [ServerHelper sendAsyncPostUserRequestWithUrlPath:@"/review" bodyInfo:dictionary delegate:delegate];
}

- (NSDictionary *)dictionary{
    
    return @{@"place_id"    :   [NSNumber numberWithInteger:self.placeId],
             @"review_text" :   self.details,
             @"rating"      :   [NSNumber numberWithInteger:self.rating]
             };
}

+ (HReview *)reviewFromDictionary:(NSDictionary *)info{
    HReview *review = [[HReview alloc] init];
    review.uniqueId = [info[@"uid"] integerValue];
    review.placeId = [info[@"place_id"] integerValue];
    review.rating = [info[@"rating"] integerValue];
    review.details = [info[@"review_text"] stringValue];
    return review;
}

@end
