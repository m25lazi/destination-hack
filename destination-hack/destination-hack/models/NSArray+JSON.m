//
//  NSArray+JSON.m
//  destination-hack
//
//  Created by Mohammed Lazim on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "NSArray+JSON.h"

@implementation NSArray (JSON)

- (NSData *)jsonData:(NSError **)error{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:error];
    
    
    return [[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSArray *)arrayFromJsonData:(NSData *)jsonData error:(NSError **)error{
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:error];
    
    return array;
}
@end
