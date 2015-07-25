//
//  NSDictionary+JSON.m
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)

- (NSData *)jsonData:(NSError **)error{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:error];
    
    
    return [[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSDictionary *)dictionaryFromJsonData:(NSData *)jsonData error:(NSError **)error{
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:error];
    
    return dict;
}

@end
