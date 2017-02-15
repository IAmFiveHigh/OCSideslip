//
//  FirstViewController.m
//  12月6i 人
//
//  Created by 我是五高你敢信 on 2016/12/6.
//  Copyright © 2016年 我是五高你敢信. All rights reserved.
//

#import "FirstViewController.h"
#import "ThirdViewController.h"


#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface FirstViewController ()

@end



@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 80);
    button.center = self.view.center;
    for (id obj in button.subviews) {
        [obj removeFromSuperview];
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 100, 40)];
    label.text = @"button";
    label.textAlignment = NSTextAlignmentCenter ;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    imageView.image = [UIImage imageNamed:@"mask"];
    
    [button addSubview:label];
    [button addSubview:imageView];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
}

- (void)buttonClick:(UIButton *)button {
    ThirdViewController *tvc = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:tvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
