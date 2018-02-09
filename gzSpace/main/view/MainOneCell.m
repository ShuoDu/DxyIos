//
//  MainOneCell.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/12.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "MainOneCell.h"

@interface MainOneCell()
@property (weak, nonatomic) IBOutlet UIView *backView;

@end
@implementation MainOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.backView.layer.masksToBounds = YES;
    self.backView.layer.cornerRadius = 8;
    self.backView.layer.shadowColor = [UIColor lightGrayColor].CGColor;//shadowColor阴影颜色
    self.backView.layer.shadowOffset = CGSizeMake(0,4);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.backView.layer.shadowOpacity = 0.8;//阴影透明度，默认0
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
