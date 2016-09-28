//
//  addPondModels.h
//  WFish_Xib
//
//  Created by 朱佳杰 on 2016/9/28.
//  Copyright © 2016年 朱佳杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface addPondModel : NSObject

@property (nonatomic, strong) NSDictionary *data;

+ (instancetype)assignDataWithDict:(NSDictionary *)data;
- (instancetype)initWithDict:(NSDictionary *)data;

@end

@interface setPondiTemsModel : NSObject

@property (nonatomic, strong) NSDictionary *data;

+ (instancetype)assignDataWithDict:(NSDictionary *)data;
- (instancetype)initWithDict:(NSDictionary *)data;

@end
