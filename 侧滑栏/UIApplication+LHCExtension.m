//
//  UIApplication+LHCExtension.m
//  12月6i 人
//
//  Created by 我是五高你敢信 on 2016/12/8.
//  Copyright © 2016年 我是五高你敢信. All rights reserved.
//

#import "UIApplication+LHCExtension.h"

@implementation UIApplication (LHCExtension)

//获取rootViewController
+ (UIViewController *)rootViewController{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    return window.rootViewController;
}

//获取Window当前显示的ViewController
+ (UIViewController*)currentViewController{
    UIViewController* vc = [UIApplication rootViewController];
    
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
        
    }
    
    return vc;
}
@end
