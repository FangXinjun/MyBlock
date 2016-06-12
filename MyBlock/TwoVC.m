//
//  TwoVC.m
//  MyBlock
//
//  Created by myApplePro01 on 16/6/8.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "TwoVC.h"
#import "ThreeViewController.h"

@interface TwoVC ()

@property (nonatomic, copy) NSString             *name;

@end

@implementation TwoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self foo];
    

    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, 100, 100)];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSLog(@"%p",&btn);
    NSLog(@"%p",&self);
    
    NSLog(@"%@",[NSThread callStackSymbols]);


}

- (void)btnClick{

    ThreeViewController *three = [[ThreeViewController alloc] init];
    //在MRC中, 如果不想让堆中的block对使用到的对象进行强引用, 用__block
    //在ARC中,如果不想让堆中的block对使用到的对象进行强引用, 用__weak
    __block typeof(self) weakSelf = self;
    three.testBlock = ^{
        NSLog(@"%@ \n", weakSelf.name);
        NSLog(@"%@ \n", self.name);  // 不会释放self
        [weakSelf logName];
    };
    [self.navigationController pushViewController:three animated:YES];
    
    NSLog(@"%p",&self);
    NSLog(@"%p",&three);

    [three release];
}

-(void) foo {
    __block int i = 1024;  // 地址传递
    int j = 1;   //  值传递  不会影响block中的值 block中访问j时,访问的是传给block中的j的值
    self.name = @"heheh";
    void (^blk)(void);  //默认情况下blcok是存储在栈中的, 如果block中使用了其它对象, 不会对其它对象进行强引用
    void (^blkInHeap)(void);
    
    blk = ^{
        NSLog(@"%d, %d  %@ \n", i, j,self.name); //copy之后 强引用 循环引用
        
    };//blk在栈里
    blkInHeap = [blk copy]; //blkInHeap在堆里  如果block存储在堆中,如果block中使用了其它对象, 会对其它对象进行强引用
    j++;
    i++;
    self.name = @"222";
    blkInHeap();
    Block_release(blkInHeap);  // 不释放掉block,self 也不会释放.(或者弱引用self)
}

- (void)logName
{
    NSLog(@"三调用 %@",self.name);
}

- (void)dealloc{
    NSLog(@"dealloc %@",self.class);
    [super dealloc];
    
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
