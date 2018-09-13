//
//  main.m
//  OVCDemo
//
//  Created by 李敏 on 2018/9/13.
//  Copyright © 2018年 李敏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "LMPerson.h"
#import "LMDog.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        
        /*
         生成模型对象
         LMPerson * person = [[LMPerson alloc]init];
         person.name = @"张三";
         person.age = 18;
         */
        
      
        
        /*
         1. 为属性赋值
        [person setValue:@"李四" forKey:@"name"];
        */
        
        /*
         2.1 修改类的私有属性
         [person setValue:@"feamel" forKey:@"sex"];
         [person printAge];
         
         */
        /**
         2.2 获取类的私有属性
         NSString * sexstr = [person valueForKey:@"sex"];
         NSLog(@"%@",sexstr);
         */
        /*
         3. 字典转模型
         注意：1->字典中的健值必须和模型中名称一样，并且只可以少于或等于模型中的健值，如果多处会报setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key weight.'这样的错误提示；
         
         NSDictionary * dic = @{
         @"name":@"lili",
         @"age":@"11",
         @"sex":@"man",
         };
         
         [person setValuesForKeysWithDictionary:dic];
         NSLog(@"person  name = ------%@   age = ---%ld",person.name,(long)person.age);
         [person printAge];
         
         */
        
        
        
 
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
  
}
