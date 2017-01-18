//
//  UpdateApp.m
//  postget
//
//  Created by storecode  on 16-7-25.
//  Copyright © 2016年 mypxq. All rights reserved.
//

#import "UpdateApp.h"
#import <objc/runtime.h>
@implementation UpdateAppBox
static char clickedbuttonkey;
- (void)show:(NSString*)mess Block:(UpdateAppBoxBlock) block
{
    self.title=@"版本更新";
    self.message=mess;
    self.delegate=self;
    [self addButtonWithTitle:@"以后再说"];
    [self addButtonWithTitle:@"现在升级"];
    if (block) {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &clickedbuttonkey, block, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
    }
    [self show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    UpdateAppBoxBlock block = objc_getAssociatedObject(self, &clickedbuttonkey);
    if (block) {
        block(buttonIndex);
    }
}

@end

@implementation UpdateApp
/**
 * 获取当前版本
 */
+ (NSString*)GetAppVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}
/**
 * 比较版本
 */
+ (Boolean)CompareVersion:(NSString*)newver Version:(NSString*)oldver {
    NSArray *arr1 = [newver componentsSeparatedByString:@"."];
    NSArray *arr2 = [oldver componentsSeparatedByString:@"."];
    for (int i=0;i<arr1.count&&i<arr2.count; i++) {
        int sv1=[[arr1 objectAtIndex:i] intValue];
        int sv2=[[arr2 objectAtIndex:i] intValue];
        if (sv1>sv2) {
            return true;
        } else if(sv1<sv2){
            return false;
        }
    }
    return arr1.count>arr2.count;
}
/**
 * 获取版本数据
 */
+ (void)CheckVersion:(NSString*)url {
    NSData *data=[NSData dataWithContentsOfURL: [NSURL URLWithString: url]];
   
    NSLog(@"%@",data);
    if (data==nil) {
        return;
    }
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    if (dic==nil) {
        return;
    }
    int type=[dic[@"type"] intValue];
    if (type==1) {
        return;
    }
    NSString *serverversion=[dic[@"version"] description];
    NSString *localversion=[UpdateApp GetAppVersion];
    Boolean isnew=[UpdateApp CompareVersion:serverversion Version:localversion];
    if (isnew) {
        if (type==2) {
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSString *saveversion = [userDefaults objectForKey:@"serverversion"];
            if ([saveversion isEqualToString:serverversion]) {
                return;
            }
            [userDefaults setObject:serverversion forKey:@"serverversion"];
            [userDefaults synchronize];
        }
        [[[UpdateAppBox alloc]init] show:[dic[@"title"] description] Block:^(NSInteger buttonIndex) {
            if (buttonIndex==1) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[dic[@"url"] description]]];
            }
        }];
    }
}
/**
 * 检查更新
 */
+ (void)CheckUpdate:(NSString*)url {
    NSData *data=[NSData dataWithContentsOfURL: [NSURL URLWithString: url]];
    if (data==nil) {
        return;
    }
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    if (dic==nil) {
        return;
    }
    NSString *serverversion=[dic[@"version"] description];
    NSString *localversion=[UpdateApp GetAppVersion];
    Boolean isnew=[UpdateApp CompareVersion:serverversion Version:localversion];
    if (isnew) {
        [[[UpdateAppBox alloc]init] show:[dic[@"title"] description] Block:^(NSInteger buttonIndex) {
            if (buttonIndex==1) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[dic[@"url"] description]]];
            }
        }];
    }
}
@end
