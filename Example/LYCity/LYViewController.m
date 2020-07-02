//
//  LYViewController.m
//  LYCity
//
//  Created by 657035229@qq.com on 07/02/2020.
//  Copyright (c) 2020 657035229@qq.com. All rights reserved.
//

#import "LYViewController.h"
#import <LYCity/LYCityGroupVC.h>
@interface LYViewController ()

@end

@implementation LYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //创建城市视图控制器对象(navController)
    
}
- (IBAction)action:(UIButton *)sender {
    LYCityGroupVC *cityGroupViewController = [LYCityGroupVC new];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:cityGroupViewController];
    //显示
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
