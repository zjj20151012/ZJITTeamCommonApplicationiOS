//
//  homeCells.h
//  WFish_xib
//
//  Created by 朱佳杰 on 16/9/4.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeModels.h"

@interface homeTitleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellNameLabel;

+ (instancetype)initHomeTitleCell:(UITableView *)tView andCellIdentify:(NSString *)cellIdentify;

- (void)assignData:(NSDictionary *)data;

@end

@interface homeDetailCell : UITableViewCell

+ (instancetype)initHomeDetailCell:(UITableView *)tView andCellIdentify:(NSString *)cellIdentify;

@end
