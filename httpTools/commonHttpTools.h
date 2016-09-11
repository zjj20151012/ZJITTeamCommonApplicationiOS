//
//  commonHttpTools.h
//  WFish_Xib
//
//  Created by 朱佳杰 on 16/9/10.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "homeModels.h"
#import "pondModels.h"

typedef void (^homeBlock)(homeModels *);
typedef void (^pondBlock)(pondModels *);

@interface commonHttpTools : NSObject

@property (nonatomic, copy) homeBlock hBlock;
@property (nonatomic, copy) pondBlock pBlock;

- (void)getHomePageHttpWithParam:(NSString *)param;
- (void)getPondPageHttpWithParam:(NSString *)userIDparam;

@end
