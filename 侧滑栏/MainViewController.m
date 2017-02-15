//
//  MainViewController.m
//  12月6i 人
//
//  Created by 我是五高你敢信 on 2016/12/6.
//  Copyright © 2016年 我是五高你敢信. All rights reserved.
//

#import "MainViewController.h"
#import "ParentViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *controllersName = @[@"FirstViewController",@"SecondViewController",@"ThirdViewController",@"FourthViewController"];
    NSArray *titles = @[@"One",@"Two",@"Three",@"Four"];
    NSMutableArray *viewControllers = @[].mutableCopy;
    
    for (int i=0; i<controllersName.count; i++) {
        Class cls = NSClassFromString(controllersName[i]);
        ParentViewController *pvc = [[cls alloc] init];
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:pvc];
        
        nvc.tabBarItem.title = titles[i];
        [viewControllers addObject:nvc];
    }
    
    self.viewControllers = viewControllers;
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
