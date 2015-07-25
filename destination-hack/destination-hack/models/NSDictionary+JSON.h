//
//  NSDictionary+JSON.h
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

- (NSData *)jsonData:(NSError **)error;
+ (NSDictionary *)dictionaryFromJsonData:(NSData *)jsonData error:(NSError **)error;

@end
