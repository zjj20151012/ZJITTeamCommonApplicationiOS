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
#import "addPondModels.h"

typedef void (^homeBlock)(homeModels *);
typedef void (^pondBlock)(pondModels *);
typedef void (^addPondBlock)(addPondModel *);
typedef void (^setPondItemsBlock)(setPondiTemsModel *);

@interface commonHttpTools : NSObject

@property (nonatomic, copy) homeBlock hBlock;
@property (nonatomic, copy) pondBlock pBlock;
@property (nonatomic, copy) addPondBlock aBlock;
@property (nonatomic, copy) setPondItemsBlock sBlock;

- (void)getHomePageHttpWithParam:(NSString *)param;
- (void)getPondPageHttpWithParam:(NSString *)userIDparam;
//删除塘口的接口
- (void)getDeletePondWithParam:(NSString *)pondID userID:(NSString *)userID;
//添加塘口的接口
/*
 输入参数：
 userId - 用户id
 pondName - 塘口名称
 pondArea - 塘口面积
 pondDepth - 塘口深度(米)
 pondDensity - 塘口密度(尾/条)
 pondUsage - 塘口使用时长(年)
 pondO2_power - 塘口增氧功率
 pondRental - 塘口租金
 pondO2_addId - 增氧方式选项Id
 pondWaterSuppliesId - 水源选项Id
 pondTopId - 池顶选项Id
 pondBottomId - 池底选项Id
 pondDischargeModeId - 排污方式选项Id
 pondThicknessId - 池底厚度Id
 */
- (void)getAddPondWithParam:(NSDictionary *)param;
//塘口设置选项信息
- (void)getSetPondItemsWithoutParam;

@end
