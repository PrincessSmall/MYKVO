//
//  ViewController.m
//  OVCDemo
//
//  Created by 李敏 on 2018/9/13.
//  Copyright © 2018年 李敏. All rights reserved.
//

#import "ViewController.h"
#import "LMKVO.h"
@interface ViewController ()
/**标签*/
@property (nonatomic , strong)UILabel * lab;
/**按钮*/
@property (nonatomic , strong)UIButton * btn;
/**模型*/
@property (nonatomic , strong)LMKVO * kvo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.lab];
    [self.view addSubview:self.btn];
//    self.lab.text = [NSString stringWithFormat:@"%d", self.kvo.num];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma  mark --lazy

-(UILabel *)lab{
    if (!_lab) {
        _lab = [[UILabel alloc]initWithFrame:CGRectMake(120, 80, 100, 50)];
        _lab.textColor = [UIColor whiteColor];
        _lab.textAlignment = NSTextAlignmentCenter;
        _lab.backgroundColor = [UIColor grayColor];
        
    }
    
    return _lab;
}

-(UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton  alloc]initWithFrame:CGRectMake(50, 150, 200, 50)];
        _btn.backgroundColor = [UIColor grayColor];
        [_btn addTarget:self action:@selector(btnCliced:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}



-(LMKVO *)kvo{
    if (!_kvo) {
        _kvo = [[LMKVO alloc]init];
        
        /**
         1. 注册kvo为被观察者
           1->forKeyPath：被观察的属性名称，此例是kvo中的num
           2->options：被观察属性的新值，旧值，这里是枚举类型
                       NSKeyValueObservingOptionOld（旧值）
                       NSKeyValueObservingOptionNew（新值）
           3->context：上下文，可以为 KVO 的回调方法传值（例如设定为一个放置数据的字典）
         */
        [_kvo addObserver:self forKeyPath:@"num" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
        
    }
    return _kvo;
}

-(void)btnCliced:(int)num{
    self.kvo.num = self.kvo.num + 1;
    NSLog(@"%d",self.kvo.num);
    
}

/**
 2. 观察的对象的属性值发生改变的时候，收到通知会调用此方法,进行相应的处理，UI更新

 @param keyPath 属性名称
 @param object 被观察对象
 @param change 属性变化前后的值都存储在change字典中
 @param context 注册观察者时，context传过来的值
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    //判断是否是kvo的@“num”属性
    if ([keyPath isEqualToString:@"num"]&& object == self.kvo) {
        
        //响应属性变化处理，UI更新（lab的值改变）
        self.lab.text = [NSString stringWithFormat:@"%@",change[@"new"]];
        
        //change的使用，上文注册时，枚举为2个，因此可以提取change字典中的新、旧值的这两个方法
        NSLog(@"old = %@   new = %@",change[@"old"],change[@"new"]);
    }
    
    
}


-(void)dealloc{
    
    //移除观察者
    [self.kvo removeObserver:self forKeyPath:@"num"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
