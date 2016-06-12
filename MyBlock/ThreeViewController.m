//
//  ThreeViewController.m
//  MyBlock
//
//  Created by myApplePro01 on 16/6/8.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "ThreeViewController.h"

#define NSSTRING_PRETTY_FUNCTION [NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSASCIIStringEncoding]

static void                 (^myTestBlock)();


@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    if (_testBlock) {
        _testBlock();
    }
    myTestBlock = _testBlock;
    NSArray *syms = [NSThread  callStackSymbols];
    if ([syms count] > 1) {
        NSLog(@"<%@ %p> %@ - caller: %@ ", [self class], self, NSStringFromSelector(_cmd),[syms objectAtIndex:1]);
    } else {
        NSLog(@"<%@ %p> %@", [self class], self, NSStringFromSelector(_cmd));
    }
    
    NSString *str = @"11111";
    int a = 2;
    static NSString *strStatic = @"static";
    NSMutableString *strM = [[NSMutableString alloc] initWithFormat:@"可变"];
    NSLog(@"str %p",str);
    NSLog(@"a %p",&a);
    NSLog(@"strStatic %p",strStatic);
    NSLog(@"myTestBlockStatic %p",myTestBlock);
    NSLog(@"strM %p",strM);

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"Function Name:%@",NSSTRING_PRETTY_FUNCTION); //打印方法名称
    NSLog(@"dealloc %@",self.class);
    [super dealloc];

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
