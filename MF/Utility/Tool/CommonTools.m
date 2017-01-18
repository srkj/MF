//
//  CommonTools.m
//  1lyn
//
//  Created by EterNa1ove、 on 16/10/20.
//  Copyright © 2016年 Monster.Z. All rights reserved.
//

#import "CommonTools.h"

@implementation CommonTools

#pragma mark - 计算文字高度
+ (CGSize)autoLayoutUILabel:(UILabel *) label basedOnContent:(NSString *)content
{
    return [self autoLayout:label.font withWidth:label.frame.size.width basedOnContent:content];
}

+ (CGSize)autoLayout:(UIFont *)font withWidth:(CGFloat)width basedOnContent:(NSString *)content
{
    CGSize actualsize = CGSizeZero;
    if (IS_IOS7) {
        //get current font attributes
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
        //IOS7 fix: get size that text needs, limit the width
        actualsize =[content boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        actualsize = [content sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    }
    return actualsize;
}

+ (void)showInstrutions:(NSString *)instruction {
    [self showInstrutions:instruction inView:[UIApplication sharedApplication].keyWindow];
}

+ (void)showInstrutions:(NSString *)instruction inView:(UIView *)view {
    // 展示字符串为空，不展示
    if (!instruction || instruction.length == 0) {
        return;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = instruction;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    
    // 防止弹出框阻塞主线程(1秒后消失)
    //    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    //    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    //        hud.removeFromSuperViewOnHide = YES;
    //        [hud hide:YES];
    //    });
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
    });
    
    
}

+ (NSString *)resultDicitionary:(NSDictionary *)dic
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *jsonStr =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonStr;
    
}
//+ (NSString*)URLEncode:(NSString*)para {
//    return (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)para, NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8));
//}
//+ (NSString *)GetDesURL:(NSString *)url {
//   
//
//    RSAEncryptor *rsa = [[RSAEncryptor alloc] init];
//    NSString *publicKeyPath = [[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"];
//    [rsa loadPrivateKeyFromFile:[[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"] password:@"123456"];
//    [rsa loadPublicKeyFromFile:publicKeyPath];
//    
//    NSString *deskey = [NSString randomStringWithLength:8];
//    
//    NSString *nurl = [url stringWithStrToDESDesKey:deskey];
//    NSString *sessionid = [[USER_D objectForKey:Session_id] stringWithStrToDESDesKey:deskey];
//    
//    NSMutableString *nowurl = [[NSMutableString alloc]initWithString:@HTTP_MAIN_URL];
//    [nowurl appendString:@"/index.php?moudle=interface&control=web&method=skip_url&url="];
//    [nowurl appendString:[self URLEncode:nurl]];
//    [nowurl appendString:[NSString stringWithFormat:@"&session_id=%@",[self URLEncode:sessionid]]];
//    
//    NSString *rsaStr = [rsa rsaEncryptString:deskey];
//    
//    [nowurl appendString:[NSString stringWithFormat:@"&des_key=%@",[self URLEncode:rsaStr]]];
//    
//    NSString *jsonString = [nurl stringWithDESToStrDesKey:deskey];
//    
//    
//    
//    return nowurl;
//}
@end
