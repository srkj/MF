//
//  NSString+Category.m
//  deyuntianxia
//
//  Created by storecode on 16/4/20.
//  Copyright © 2016年 storecode. All rights reserved.
//

#import "NSString+Category.h"

static NSString * const letters = @"dfkdsafj484980229034848448498";

@implementation NSString (Category)

+ (NSString *) randomStringWithLength: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}


@end
