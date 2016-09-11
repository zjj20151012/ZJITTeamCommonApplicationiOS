//
//  commonHttpTools.h
//  WFish_Xib
//
//  Created by 朱佳杰 on 16/9/10.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "homeModels.h"

typedef void (^homeBlock)(homeModels *);

@interface commonHttpTools : NSObject

@property (nonatomic, copy) homeBlock hBlock;

- (void)getHomePageHttpWithParam:(NSString *)param;

@end
