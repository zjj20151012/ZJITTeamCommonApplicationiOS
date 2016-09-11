//
//  CommonFun.m
//  WFish
//
//  Created by zjj on 16/5/9.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "CommonObj.h"
#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>

static commonObj* _comObj;
commonObj* g(){
    if(!_comObj) {
        _comObj = [[commonObj alloc] init];
    }
    return _comObj;
}

//判断输入框是否为空
BOOL didTextFieldEmpty(NSString *text){
    if (text != NULL && text.length >0){
        return YES;
    }else{
        return NO;
    }
}

//判断手机号格式是否正确
BOOL didTelNumRight(NSString *telNum){
    if(didTextFieldEmpty(telNum) || telNum.length == 11) {
       /**
        * 手机号码
        * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
        * 联通：130,131,132,152,155,156,185,186
        * 电信：133,1349,153,180,189
        */
        NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
        /**
         10         * 中国移动：China Mobile
         11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
         12         */
        NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[12378])\\d)\\d{7}$";
        /**
         15         * 中国联通：China Unicom
         16         * 130,131,132,152,155,156,185,186
         17         */
        NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
        /**
         20         * 中国电信：China Telecom
         21         * 133,1349,153,180,189
         22         */
        NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
        /**
         25         * 大陆地区固话及小灵通
         26         * 区号：010,020,021,022,023,024,025,027,028,029
         27         * 号码：七位或八位
         28         */
        // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
        
        NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
        NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
        NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
        NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
        
        if (([regextestmobile evaluateWithObject:telNum] == YES)
            || ([regextestcm evaluateWithObject:telNum] == YES)
            || ([regextestct evaluateWithObject:telNum] == YES)
            || ([regextestcu evaluateWithObject:telNum] == YES))
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }else{
         return NO;
   }
}


//判断是不是NULL
BOOL didNull(id sender){
    if ([sender isEqual:[NSNull null]]){
        return NO;
    }else{
        return YES;
    }
}

//字符串转16进制
NSString* hexStringFromString(NSString* string){
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;

}

//16进制转字符串
// 十六进制转换为普通字符串的。
NSString* stringFromHexString(NSString* hexString){
    
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    NSLog(@"------字符串=======%@",unicodeString);
    return unicodeString; 

}
