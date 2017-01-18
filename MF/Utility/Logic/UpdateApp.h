//
//  UpdateApp.h
//  postget
//
//  Created by storecode  on 16-7-25.
//  Copyright © 2016年 mypxq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UpdateAppBox : UIAlertView
typedef void(^UpdateAppBoxBlock) (NSInteger buttonIndex);
@end
@interface UpdateApp : NSObject
+ (void)CheckVersion:(NSString*)url;
+ (void)CheckUpdate:(NSString*)url;
@end
