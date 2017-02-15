//
//  LeftViewController.h
//  12月6i 人
//
//  Created by 我是五高你敢信 on 2016/12/6.
//  Copyright © 2016年 我是五高你敢信. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftViewControllerDelegate <NSObject>

- (void)fromCurrentViewPushControllerWithNumber:(NSInteger)index;

@end

@interface LeftViewController : UIViewController

@property (nonatomic, assign) id <LeftViewControllerDelegate>delegate;


@end
