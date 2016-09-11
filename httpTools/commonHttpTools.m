//
//  commonHttpTools.m
//  WFish_Xib
//
//  Created by 朱佳杰 on 16/9/10.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import "commonHttpTools.h"
#import "homeModels.h"
#import "pondModels.h"
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


@end
