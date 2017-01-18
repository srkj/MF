//
//  GlobalApp.h
//  meiliyouyue
//
//  Created by EterNa1ove、 on 16/10/6.
//  Copyright © 2016年 Monster.Z. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  负责app相关
 */
@interface GlobalApp : NSObject

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UIWindow *window;

+ (instancetype)sharedInstance;

/**
 *  app启动后所做的操作
 */
- (void)handleAfterAppBoot:(UIWindow *)window;

/**
 进入首页
 */
- (void)gotoMainViewController;



@end
