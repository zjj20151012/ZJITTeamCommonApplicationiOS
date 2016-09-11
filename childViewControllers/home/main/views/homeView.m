//
//  homeView.m
//  WFish_xib
//
//  Created by 朱佳杰 on 16/9/4.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import "homeView.h"
#import "CommonFun.h"
#import "homeModels.h"
#import "YiRefreshHeader.h"
#import "homeCells.h"
#import "commonHttpTools.h"

@interface homeView ()<UITableViewDelegate,UITableViewDataSource>{
    //下拉刷新头
    YiRefreshHeader *refreshHeader;
}

@property (strong, nonatomic) homeModels *hModels;

@end


@implementation homeView

//初始化的通用方法(必写)
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self didInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self didInit];
    }
    return self;
}

#pragma mark -init
- (void)didInit {
    //tableView的代理以及数据资源
    self.delegate = self;
    self.dataSource = self;
    //设置偏移量
    self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //网络请求调用
    [self reqEquipment];
    //初始化下拉刷新头
    refreshHeader = [[YiRefreshHeader alloc] init];
    refreshHeader.scrollView = self;
    [refreshHeader header];
    //防止循环引用
    __weak typeof (self)weakSelf = self;
    //下拉刷新的操作写在这个block中
    refreshHeader.beginRefreshingBlock=^(){
        [weakSelf reqEquipment];
    };
}

#pragma mark -reqs
- (void)reqEquipment{
    commonHttpTools *tools = [[commonHttpTools alloc]init];
    [tools getHomePageHttpWithParam:@"1"];
    //block回调方法
    tools.hBlock = ^(homeModels *model){
      //将返回回来的数据赋值给模型以备后用
      self.hModels = model;
      //网络请求完后刷新列表
      [self reloadData];
      //结束刷新
      [refreshHeader endRefreshing];
    };
}

#pragma mark -tableViewDelegate && tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _hModels.pondNameArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *homeTitleCellIdentify = @"homeTitleCell";
//    NSString *homeDetailCellIdentify = @"homeDetailCell";
//    if (indexPath.row == 0){
    //初始化xibCell
    homeTitleCell *cell = [homeTitleCell initHomeTitleCell:self andCellIdentify:homeTitleCellIdentify];
    //模型转成字典
    NSDictionary *dict = _hModels.pondNameArr[indexPath.row];
    //调用方法进行一些数据逻辑的操作
    [cell assignData:dict];
    return cell;
//    }else {
//        homeDetailCell *cell = [homeDetailCell initHomeDetailCell:self andCellIdentify:homeDetailCellIdentify];
//        return cell;
//    }
}


@end
