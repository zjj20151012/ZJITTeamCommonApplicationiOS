//
//  homeModels.m
//  WFish_xib
//
//  Created by 朱佳杰 on 16/9/4.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import "homeModels.h"
#import "CommonFun.h"

@implementation homeModels

+ (instancetype)assignDataWithArr:(NSArray *)arr{
    return [[self alloc]initWithArr:arr];
}

- (instancetype)initWithArr:(NSArray *)arr{
    if (self = [super init]){
        self.pondNameArr = arr;
    }
    return self;
}


@end
