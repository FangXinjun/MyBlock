//
//  ViewController.m
//  MyBlock
//
//  Created by myApplePro01 on 16/6/3.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "ViewController.h"
#import "TwoVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (IBAction)btnClick:(UIButton *)sender {
    TwoVC *two = [[TwoVC alloc] init];
    [self.navigationController pushViewController:two animated:YES];
    [two release];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}

@end
