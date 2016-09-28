//
//  addPondModels.m
//  WFish_Xib
//
//  Created by 朱佳杰 on 2016/9/28.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import "addPondModels.h"

@implementation addPondModel

+ (instancetype)assignDataWithDict:(NSDictionary *)data{
    return [[self alloc]initWithDict:data];
}

- (instancetype)initWithDict:(NSDictionary *)data{
    if (self = [super init]){
        self.data = data;
    }
    return self;
}

@end

@implementation setPondiTemsModel

+ (instancetype)assignDataWithDict:(NSDictionary *)data{
    return [[self alloc]initWithDict:data];
}

- (instancetype)initWithDict:(NSDictionary *)data{
    if (self = [super init]){
        self.data = data;
    }
    return self;
}

@end
