//
//  ThreeViewController.h
//  MyBlock
//
//  Created by myApplePro01 on 16/6/8.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeViewController : UIViewController
// block用copy原因就是为了将block保存在堆中, 只要对象存储block就存储
@property (nonatomic, copy) void                 (^testBlock)();

@end
