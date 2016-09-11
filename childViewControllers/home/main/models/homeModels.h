//
//  homeModels.h
//  WFish_xib
//
//  Created by 朱佳杰 on 16/9/4.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface homeModels : NSObject

@property (strong, nonatomic) NSArray *pondNameArr;
+ (instancetype) assignDataWithArr:(NSArray *)arr;
- (instancetype) initWithArr:(NSArray *)arr;



@end
