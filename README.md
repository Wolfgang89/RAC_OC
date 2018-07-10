
#  响应式编程-RAC学习心得


##  RAC

     RAC接管了所有的苹果的事件机制。（代理 tagget KVO 通知 ）
    
     特点是比较难学习 这个框架学习曲线异常的陡峭 比较的重 这个框架比较重 ，使用之后就回不去了 需要不断的代码审核，是不是简单易读 团队中的所有人的代码风格一致 别人写的自己能不能看懂 自己写的别人能不能看懂。
     RAC本身是支持 swift的，RAC 2.5 的版本不支持swift。RAC3.0最后一个纯OC的RAC版本。 再往下 4.0 开始支持Swift。
     RAC原理是监听事件机制，苹果的事件机制包装成信号，信号发生了改变，进而订阅者作出相应的反应。
     
###   RAC如何把事件包装成信号

    iOS事件----->signal信号 ----> next
                          ----> completed    
                          ----> error     


*      RAC的信号分冷信号和热信号。


```      
        // 1. 创建信号
        RACSignal *signal =  [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"----RAC--3333来了-------");
                //  3.  发送信号
        [subscriber sendNext:@"hello World!"];
                    return nil;
            }];
    
        // 2.订阅信号
        [signal subscribeNext:^(id  _Nullable x) {
    
        // x 是信号内容本身
            NSLog(@"-----x-----%@",x);
        }]; 
    
```


>    事件机制的原理
     
      Block不属于事件机制，是一段代码块。什么时候开始执行，并不知道。RAC中Block做参数，返回值。信号在传递的过程中使用的是block，数据和事件通过block在传递和处理。
    



