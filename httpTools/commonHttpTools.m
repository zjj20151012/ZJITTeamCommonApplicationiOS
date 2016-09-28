//
//  commonHttpTools.m
//  WFish_Xib
//
//  Created by 朱佳杰 on 16/9/10.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import "commonHttpTools.h"
#import "AFNetworking.h"
#import "Const.h"
#import "homeView.h"
#import "SVProgressHUD.h"
#import "CommonFun.h"


@interface commonHttpTools ()

@property (nonatomic, strong) homeModels *mModel;
@property (nonatomic, strong) pondModels *pModel;

@end

@implementation commonHttpTools

- (void)getHomePageHttpWithParam:(NSString *)param{
    didNetWorkConnect();
    [SVProgressHUD showWithStatus:@"加载中..." maskType:SVProgressHUDMaskTypeClear];
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSMutableSet *contentType = [[NSMutableSet alloc]initWithSet:session.responseSerializer.acceptableContentTypes];
    [contentType addObject:@"text/html"];
    session.responseSerializer.acceptableContentTypes = contentType;
    [session GET:[BASE_URL stringByAppendingString:@"equipment/equipmentBrief.php"]
      parameters:@{
                   @"userId":param,
                   }
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [SVProgressHUD dismiss];
            homeModels *m = [homeModels assignDataWithArr:responseObject[@"result"]];
            _mModel = m;
            if (self.hBlock != nil){
                self.hBlock(_mModel);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD showErrorWithStatus:@"网络错误"];
        }];
}

- (void)getPondPageHttpWithParam:(NSString *)userIDparam{
    [SVProgressHUD showWithStatus:@"加载中..." maskType:SVProgressHUDMaskTypeClear];
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSMutableSet *contentType = [[NSMutableSet alloc]initWithSet:session.responseSerializer.acceptableContentTypes];
    [contentType addObject:@"text/html"];
    session.responseSerializer.acceptableContentTypes = contentType;
    [session GET:[BASE_URL stringByAppendingString:@"pond/pondList.php"]
      parameters:@{
                   @"userId":userIDparam,
                   }
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if ([responseObject[@"code"] integerValue] == 2){
                [SVProgressHUD showInfoWithStatus:@"没有塘口信息!"];
            }else{
                pondModels *p = [pondModels assignDataWithArr:responseObject[@"result"]];
                _pModel = p;
                if (self.pBlock != nil){
                    self.pBlock(_pModel);
                }

                [SVProgressHUD dismiss];
                
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD showErrorWithStatus:@"网络错误"];
       }];
}
//删除塘口
- (void)getDeletePondWithParam:(NSString *)pondID userID:(NSString *)userID{
    [SVProgressHUD showWithStatus:@"删除中..." maskType:SVProgressHUDMaskTypeClear];
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSMutableSet *contentType = [[NSMutableSet alloc]initWithSet:session.responseSerializer.acceptableContentTypes];
    [contentType addObject:@"text/html"];
    session.responseSerializer.acceptableContentTypes = contentType;
    [session GET:[BASE_URL stringByAppendingString:@"pond/pondDelete.php"]
      parameters:@{
                   @"pondId":pondID,
                   @"userId":userID,
                   }
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if ([responseObject[@"code"] integerValue] == 2){
                [SVProgressHUD showErrorWithStatus:@"删除失败!"];
            }else{
                [SVProgressHUD showSuccessWithStatus:@"删除成功!"];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD showErrorWithStatus:@"网络错误"];
        }];
}
//添加塘口
- (void)getAddPondWithParam:(NSDictionary *)param{
    [SVProgressHUD showWithStatus:@"加载中..." maskType:SVProgressHUDMaskTypeClear];
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSMutableSet *contentType = [[NSMutableSet alloc]initWithSet:session.responseSerializer.acceptableContentTypes];
    [contentType addObject:@"text/html"];
    session.responseSerializer.acceptableContentTypes = contentType;
    [session GET:[BASE_URL stringByAppendingString:@"pond/pondAdd.php"]
      parameters:@{
                   @"userId":param[@"userId"],
                   @"pondName":param[@"pondName"],
                   @"pondArea":param[@"pondArea"],
                   @"pondName":param[@"pondName"],
                   @"pondDepth":param[@"pondDepth"],
                   @"pondDensity":param[@"pondDensity"],
                   @"pondUsage":param[@"pondUsage"],
                   @"pondO2_power":param[@"pondO2_power"],
                   @"pondRental":param[@"pondRental"],
                   @"pondO2_addId":param[@"pondO2_addId"],
                   @"pondWaterSuppliesId":param[@"pondWaterSuppliesId"],
                   @"pondTopId":param[@"pondTopId"],
                   @"pondBottomId":param[@"pondBottomId"],
                   @"pondDischargeModeId":param[@"pondDischargeModeId"],
                   @"pondThicknessId":param[@"pondThicknessId"],
                   }
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if ([responseObject[@"code"] integerValue] == 2){
                [SVProgressHUD showErrorWithStatus:@"添加失败!"];
            }else{
                [SVProgressHUD showSuccessWithStatus:@"添加成功!"];
                addPondModel *a = [addPondModel assignDataWithDict:responseObject[@"result"]];
                if (self.aBlock != nil){
                    self.aBlock(a);
                }
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD showErrorWithStatus:@"网络错误"];
        }];
}
//塘口设置选项信息
- (void)getSetPondItemsWithoutParam{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSMutableSet *contentType = [[NSMutableSet alloc]initWithSet:session.responseSerializer.acceptableContentTypes];
    [contentType addObject:@"text/html"];
    session.responseSerializer.acceptableContentTypes = contentType;
    [session GET:[BASE_URL stringByAppendingString:@"pond/pondSetUpList.php"]
      parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if ([responseObject[@"code"] integerValue] == 2){
                [SVProgressHUD showErrorWithStatus:@"获取设置选项失败!"];
            }else{
                setPondiTemsModel *s = [setPondiTemsModel assignDataWithDict:responseObject[@"result"]];
                if (self.sBlock != nil){
                    self.sBlock(s);
                }
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD showErrorWithStatus:@"网络错误"];
        }];
}


@end
