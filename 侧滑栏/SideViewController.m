//
//  SideViewController.m
//  12月6i 人
//
//  Created by 我是五高你敢信 on 2016/12/6.
//  Copyright © 2016年 我是五高你敢信. All rights reserved.
//

#import "SideViewController.h"
#import "MainViewController.h"
#import "LeftViewController.h"
#import "NewViewController.h"
#import "UIApplication+LHCExtension.h"


@interface SideViewController () <LeftViewControllerDelegate,UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) MainViewController *contentViewController;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) LeftViewController *leftViewController;

@property (nonatomic, strong) UIView *leftView;


@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic, assign) CGPoint panBeginPoint;

@end

@implementation SideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.contentViewController = [[MainViewController alloc] init];
    self.leftViewController = [[LeftViewController alloc] init];
    self.leftViewController.delegate = self;
    
    self.contentView = self.contentViewController.view;
    self.leftView = self.leftViewController.view;
    
    [self.view addSubview:self.leftView];
    [self.view addSubview:self.contentView];
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestEvent:)];
    self.panGesture.delegate = self;
    [self.contentView addGestureRecognizer:self.panGesture];
    
    
    
}

//MARK:- 拖拽事件
- (void)panGestEvent:(UIPanGestureRecognizer *)panGesture {
    CGPoint translation = [panGesture translationInView:panGesture.view];
    CGPoint velocity = [panGesture velocityInView:panGesture.view];
    
    CGFloat gap = self.view.bounds.size.width * 3.0 / 4.0;
    CGFloat sensitivePosition = self.view.bounds.size.width / 2.f;

    if (velocity.x < 0 && self.contentView.frame.origin.x < 0) {
        CGRect frame = self.contentView.frame;
        frame.origin.x = 0;
        self.contentView.frame = frame;
    }else {
        if (panGesture.state == UIGestureRecognizerStateBegan) {
            //开始
            self.panBeginPoint = translation;
            if (self.contentView.frame.origin.x >= sensitivePosition) {
                CGPoint point = self.panBeginPoint;
                point.x -= gap;
                self.panBeginPoint = point;
            }
        }else if (panGesture.state == UIGestureRecognizerStateChanged) {
            //变化中
            CGRect frame = self.contentView.frame;
            frame.origin.x = translation.x - self.panBeginPoint.x;
            self.contentView.frame = frame;
            if (self.contentView.frame.origin.x < 0) {
                CGRect frame = self.contentView.frame;
                frame.origin.x = 0;
                self.contentView.frame = frame;
            }
        }else if (panGesture.state == UIGestureRecognizerStateEnded) {
            //结束
            [UIView animateWithDuration:0.20f animations:^{
                
                if (self.contentView.frame.origin.x >= sensitivePosition ){
                    CGRect frame = self.contentView.frame;
                    frame.origin.x = gap;
                    self.contentView.frame = frame;
                }else {
                    CGRect frame = self.contentView.frame;
                    frame.origin.x = 0;
                    self.contentView.frame = frame;
                }
            }];

        }
    }
}

//MARK:- leftViewController delegate方法
- (void)fromCurrentViewPushControllerWithNumber:(NSInteger)index {
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = self.contentView.frame;
        frame.origin.x = 0;
        self.contentView.frame = frame;
    }];
    
    NewViewController *vc = [[NewViewController alloc] init];
    
    UINavigationController *currentVc = self.contentViewController.selectedViewController;
    
    for (UIGestureRecognizer *gesture in self.contentView.gestureRecognizers) {
        if (self.panGesture == gesture) {
            gesture.enabled = NO;
        }
    }
    
    currentVc.delegate = self;
    
    [currentVc pushViewController:vc animated:YES];
    
}

//MARK:- gesture delegate方法
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint point = [touch locationInView:gestureRecognizer.view];
    if (point.x < self.view.bounds.size.width / 3) {
        return YES;
    } else {
        return NO;
    }

}

//MARK:- navigationDelegate方法
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (navigationController.viewControllers.count == 1) {
        for (UIGestureRecognizer *gesture in self.contentView.gestureRecognizers) {
            if (self.panGesture == gesture) {
                gesture.enabled = YES;
            }
        }
    }
}



@end
