//
//  MeOneCell.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/22.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "MeOneCell.h"
#import "UIButton+JKImagePosition.h"
@interface MeOneCell()
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;
@property (nonatomic, copy) void (^callback)(NSInteger);
@end
@implementation MeOneCell
+ (instancetype)insWithCallback:(void(^)(NSInteger))callback {
    MeOneCell *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    view.callback = callback;
    return view;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //[self.oneBtn jk_setImagePosition:2 spacing:15]; //设置btn图片的位置
    self.oneBtn.tag = 201;
    self.twoBtn.tag = 202;
    self.threeBtn.tag = 203;
    self.fourBtn.tag = 204;
}
- (IBAction)oneAction:(id)sender {
      self.callback(self.oneBtn.tag);
}
- (IBAction)twoAction:(id)sender {
      self.callback(self.twoBtn.tag);
}
- (IBAction)threeAction:(id)sender {
      self.callback(self.threeBtn.tag);
}
- (IBAction)fourAction:(id)sender {
      self.callback(self.fourBtn.tag);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
