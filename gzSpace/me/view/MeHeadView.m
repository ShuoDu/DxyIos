//
//  MeHeadView.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/11.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "MeHeadView.h"

@implementation MeHeadView
+ (instancetype)ins {
    MeHeadView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    return view;
}


@end
