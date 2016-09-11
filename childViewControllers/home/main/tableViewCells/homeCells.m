//
//  homeCells.m
//  WFish_xib
//
//  Created by 朱佳杰 on 16/9/4.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import "homeCells.h"
#import "homeModels.h"

@implementation homeTitleCell

+ (instancetype)initHomeTitleCell:(UITableView *)tView andCellIdentify:(NSString *)cellIdentify{
    homeTitleCell *cell = [tView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"homeCells" owner:self options:nil]firstObject];
    }
    return cell;
}

- (void)assignData:(NSDictionary *)data{
    self.cellNameLabel.text = data[@"pondName"];
}

@end

@implementation homeDetailCell

+ (instancetype)initHomeDetailCell:(UITableView *)tView andCellIdentify:(NSString *)cellIdentify{
    homeDetailCell *cell = [tView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"homeCells" owner:self options:nil]lastObject];
    }
    return cell;
}

@end
