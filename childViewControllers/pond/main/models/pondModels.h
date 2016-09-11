//
//  pondModels.h
//  WFish_xib
//
//  Created by 朱佳杰 on 16/9/4.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface pondModels : NSObject

@property (strong, nonatomic) NSArray *pondInfoArr;
+ (instancetype) assignDataWithArr:(NSArray *)arr;
- (instancetype) initWithArr:(NSArray *)arr;

@end
