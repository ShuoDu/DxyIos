//
//  MeTwoCell.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/22.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "MeTwoCell.h"
@interface MeTwoCell()
@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIButton *four;
@property (nonatomic, copy) void (^callback)(NSInteger);
@end
@implementation MeTwoCell

+ (instancetype)insWithCallback:(void(^)(NSInteger))callback {
    MeTwoCell *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    view.callback = callback;
    return view;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.one.tag = 301;
    self.two.tag = 302;
    self.three.tag = 303;
    self.four.tag = 304;

}
- (IBAction)oneAction:(id)sender {
    self.callback(self.one.tag);
}
- (IBAction)twoAction:(id)sender {
     self.callback(self.two.tag);
}
- (IBAction)threeAction:(id)sender {
     self.callback(self.three.tag);
}
- (IBAction)fourAction:(id)sender {
     self.callback(self.four.tag);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
