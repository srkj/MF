//
//  GlobalApp.m
//  meiliyouyue
//
//  Created by EterNa1ove、 on 16/10/6.
//  Copyright © 2016年 Monster.Z. All rights reserved.
//

#import "GlobalApp.h"
#import "MFMainVC.h"
#import "MFCommunityVC.h"
#import "MFMeVC.h"
#import "MFPurposeVC.h"

/**
 * 自定义导航条style
 */
typedef NS_ENUM(NSInteger, CustomNavigationBarStyle){
    /**
     *  绿色
     */
    CustomNavigationBarStyleGreen          = 0,
    /**
     *  白色
     */
    CustomNavigationBarStyleWhite          = 1,
    /**
     *  黑色
     */
    CustomNavigationBarStyleBlack          = 2
};

@interface GlobalApp ()<UITabBarControllerDelegate,UITabBarDelegate>

@end

@implementation GlobalApp

+ (instancetype)sharedInstance{
    static GlobalApp *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [GlobalApp new];
    });
    return _sharedInstance;
}

- (void)handleAfterAppBoot:(UIWindow *)window {
    self.window = window;
    
    
    
    
    [self buildRootView];
    
}
/**
 *  正常进入程序
 */
- (void)buildRootView {
    

    
    self.window.rootViewController = [UIViewController new];
    
    [self gotoMainViewController];
    
    
    
    
    
}
/**
 *  进入到登录页面
 */
- (void)gotoLoginViewController
{
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(ScreenWidth, ScreenHeight) forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance]setTintColor: [UIColor colorWithHexString:@"#fc4549"]];
    
    
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"white"] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance]setShadowImage:[UIImage new]];
    
}
/**
 *  进入到主页面
 */
- (void)gotoMainViewController
{
    // 配置tabbar
    [self configureTabBarController];
}
/**
 *  配置tabbarController
 */
- (void)configureTabBarController
{
    
    [[UINavigationBar appearance]setTranslucent:NO];
    
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(ScreenWidth, ScreenHeight) forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance]setTintColor: [UIColor blackColor]];
    
 
    // Tabitem的标题字体
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#06b973"], NSForegroundColorAttributeName,[UIFont fontWithName:HelveticaNeueFontName size:0.0], NSFontAttributeName,nil]forState:UIControlStateSelected];

    /** ViewControllers **/
    //主页视图
    MFMainVC *mainVC = [[MFMainVC alloc]init];
    //意向视图
    MFPurposeVC *purposeVC = [[MFPurposeVC alloc]init];
    //社区视图
    MFCommunityVC *communityVC = [[MFCommunityVC alloc]init];
    // 我的视图
    MFMeVC *meVC = [[MFMeVC alloc]init];

    /* 4个tab的视图控制器的导航 */
    UINavigationController *mainNC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    UINavigationController *purposeNC = [[UINavigationController alloc] initWithRootViewController:purposeVC];
    UINavigationController *communityNC = [[UINavigationController alloc]initWithRootViewController:communityVC];
    UINavigationController *meNC = [[UINavigationController alloc]initWithRootViewController:meVC];
    
    /* 分别设置4个tabbaritem的背景图片 */
    UITabBarItem *mainTBI = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"tabbar_main_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_main_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UITabBarItem *purposeTBI = [[UITabBarItem alloc] initWithTitle:@"意向" image:[[UIImage imageNamed:@"tabbar_goods_classify_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_goods_classify_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UITabBarItem *communityTBI = [[UITabBarItem alloc] initWithTitle:@"社区" image:[[UIImage imageNamed:@"tabbar_shoppingcart_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_shoppingcart_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UITabBarItem *meTBI = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"tabbar_user_center_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_user_center_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    mainNC.tabBarItem = mainTBI;
    purposeNC.tabBarItem = purposeTBI;
    communityNC.tabBarItem = communityTBI;
    meNC.tabBarItem = meTBI;
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    self.window.rootViewController = self.tabBarController;
    [self.tabBarController setViewControllers:@[mainNC, purposeNC,communityNC,meNC]];
    
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSLog(@"--tabbaritem.title--%@",viewController.tabBarItem.title);
    
    
    
    
    
    return YES;
}



- (BOOL)isLogin {
    return nil;
}
- (void)gotoLoginVC
{
  }
- (void)gotoRegisterVC
{
   
}

@end
