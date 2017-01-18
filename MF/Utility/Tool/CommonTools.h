//
//  CommonTools.h
//  1lyn
//
//  Created by EterNa1ove、 on 16/10/20.
//  Copyright © 2016年 Monster.Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface CommonTools : NSObject

#pragma mark - 计算文字高度
/**
 *  根据文字字体、内容、空间宽度计算文字高度
 *
 *  @param font    文字字体
 *  @param width   文字空间宽度
 *  @param content 文字内容
 *
 *  @return 计算后的文字CGSize
 */
+ (CGSize)autoLayout:(UIFont *)font withWidth:(CGFloat)width basedOnContent:(NSString *)content;

/**
 *  根据文字内容计算label应有的高度
 *
 *  @param label   label
 *  @param content 文字内容
 *
 *  @return 计算后的文字CGSize
 */
+ (CGSize)autoLayoutUILabel:(UILabel *) label basedOnContent:(NSString *)content;


/**
 *  在window上展示提示信息(1秒后消失)
 *
 *  @param instruction 提示信息
 */
+ (void)showInstrutions:(NSString *)instruction;

/**
 *  在view上展示提示信息(1秒后消失)
 *
 *  @param instruction 提示信息
 *  @param view 要展示信息的view
 */
+ (void)showInstrutions:(NSString *)instruction inView:(UIView *)view;


+ (NSString *)resultDicitionary:(NSDictionary *)dic;

//+ (NSString*)URLEncode:(NSString*)para;
//
//+ (NSString *)GetDesURL:(NSString *)url;


@end
