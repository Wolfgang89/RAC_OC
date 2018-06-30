//
//  ViewController.m
//  RACPra
//
//  Created by panwg on 2018/7/1.
//  Copyright © 2018年 wolfgang. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveObjC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 响应式编程
    // RAC接管了所有的苹果的事件机制。（代理 tagget KVO 通知 ）
    /* 特点是比较难学习 这个框架学习曲线异常的陡峭 比较的重 这个框架比较重 ，使用之后就回不去了 需要不断的代码审核，是不是简单易读 团队中的所有人的代码风格一致 别人写的自己能不能看懂 自己写的别人能不能看懂。
     RAC本身是支持 swift的，RAC 2.5 的版本不支持swift。RAC3.0最后一个纯OC的RAC版本。 再往下 4.0 开始支持Swift。
     */
    
    // 1. 创建信号
    RACSignal *signal =  [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"----RAC--3333来了-------");
        // 3.  发送信号
        [subscriber sendNext:@"hello World!"];
        return nil;
    }];
    
    // 2.订阅信号
    [signal subscribeNext:^(id  _Nullable x) {
        
        // x 是信号内容本身
        NSLog(@"-----x-----%@",x);
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
