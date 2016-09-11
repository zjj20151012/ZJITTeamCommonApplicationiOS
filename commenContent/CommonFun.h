//
//  CommonFun.h
//  WFish
//
//  Created by zjj on 16/5/9.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Const.h"
#import "CommonObj.h"

//通用对象
commonObj *g();
// 判断字符串不为空
BOOL didTextFieldEmpty(NSString* text);
// 判断手机号格式是否正确
BOOL didTelNumRight(NSString *telNum);
// 判断是不是NULL
BOOL didNull(id sender);
// 字符串转16进制
NSString* hexStringFromString(NSString* string);
// 16进制转字符串
NSString* stringFromHexString(NSString* hexString);
