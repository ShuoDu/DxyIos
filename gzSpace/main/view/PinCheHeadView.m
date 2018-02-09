//
//  PinCheHeadView.m
//  gzSpace
//
//  Created by 智享单车 on 2018/2/8.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "PinCheHeadView.h"
@interface PinCheHeadView ()
@property (nonatomic, copy) void (^callback)(NSInteger);
@end

@implementation PinCheHeadView
+ (instancetype)ins:(void(^)(NSInteger))callback {
    PinCheHeadView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    view.callback = callback;
    return view;
}
-(void)layoutSubviews {
    [super layoutSubviews];
}

@end
