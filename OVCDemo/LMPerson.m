//
//  LMPerson.m
//  OVCDemo
//
//  Created by 李敏 on 2018/9/13.
//  Copyright © 2018年 李敏. All rights reserved.
//

#import "LMPerson.h"

@interface LMPerson()

@property (nonatomic , copy)NSString * sex;

@end

@implementation LMPerson


-(void)printAge{
    NSLog(@"%@",self.sex);
}

-(instancetype)init{
    if (self = [super init]) {
        
        self.sex = @"feamel";
    }
    return self;
}



@end
