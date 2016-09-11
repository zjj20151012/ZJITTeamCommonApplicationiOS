//
//  pondView.m
//  WFish_xib
//
//  Created by 朱佳杰 on 16/9/4.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import "pondView.h"
#import "commonHttpTools.h"
#import "pondModels.h"

@interface pondView()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) pondModels *pModels;


@end

@implementation pondView

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
    [self reqPondInfo];
}

#pragma mark -reqs
- (void)reqPondInfo{
    commonHttpTools *tools = [[commonHttpTools alloc]init];
    [tools getPondPageHttpWithParam:@"1"];
    tools.pBlock = ^(pondModels *model){
        self.pModels = model;

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
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}

@end
