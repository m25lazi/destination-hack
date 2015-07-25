//
//  NSArray+JSON.h
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JSON)
- (NSData *)jsonData:(NSError **)error;
+ (NSArray *)arrayFromJsonData:(NSData *)jsonData error:(NSError **)error;
@end
