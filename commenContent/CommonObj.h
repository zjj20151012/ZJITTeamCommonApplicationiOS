//
//  CommonObj.h
//  WFish
//
//  Created by zjj on 16/5/9.
//  Copyright © 2016年 zjj. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Const.h"
#import "mainTabVC.h"

@interface commonObj : NSObject
@property (nonatomic, strong) NSString *userNum;         // 用户名(手机号)
@property (nonatomic, strong) NSString *userPwd;         // 用户密码
@property (nonatomic, strong) NSString *userId;          // 登录后的ID
@property (nonatomic, strong) NSString *userName;        // 登陆后获取的用户名
@property (nonatomic, strong) NSString *deviceID;        // 设备id
@property (nonatomic, strong) NSString *groupID;         // 组id
@property (nonatomic, strong) NSString *pondID;          // 塘口id
@property (nonatomic, strong) NSString *pondName;
@property (nonatomic, strong) NSString *isAddPond;      
@property (nonatomic, strong) NSString *o2addID;
@property (nonatomic, strong) NSString *waterID;
@property (nonatomic, strong) NSString *topID;
@property (nonatomic, strong) NSString *bottomID;
@property (nonatomic, strong) NSString *disChargeID;
@property (nonatomic, strong) NSString *thicknessID;

@property (nonatomic, strong) NSMutableDictionary *addPondDict;
@property (nonatomic, strong) NSMutableDictionary *setDeviceDict;
@property (nonatomic, strong) NSDictionary *warningInfoDict;




@end
