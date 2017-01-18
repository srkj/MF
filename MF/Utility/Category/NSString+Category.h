//
//  NSString+Category.h
//  deyuntianxia
//
//  Created by storecode on 16/4/20.
//  Copyright © 2016年 storecode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

/**
 *  生成指定长度的随机字符串
 *
 *  @param len 要生成字符串的长度
 *
 *  @return 生成后的字符串
 */
+ (NSString *) randomStringWithLength: (int) len;

@end
