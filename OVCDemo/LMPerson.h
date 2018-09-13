//
//  LMPerson.h
//  OVCDemo
//
//  Created by 李敏 on 2018/9/13.
//  Copyright © 2018年 李敏. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LMDog;

@interface LMPerson : NSObject

/**名称*/
@property (nonatomic , copy)NSString * name;
/**年龄*/
@property (nonatomic , assign)NSInteger  age;
/**dog*/
@property (nonatomic , strong)LMDog * dog;


-(void)printAge;

@end
