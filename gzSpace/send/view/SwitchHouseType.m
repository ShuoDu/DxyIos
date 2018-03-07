//
//  SwitchHouseType.m
//  gzSpace
//
//  Created by 智享单车 on 2018/3/7.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "SwitchHouseType.h"
#import "UIColor+YYAdd.h"
@interface SwitchHouseType()
@property (nonatomic, copy) void (^callback)(NSInteger);
@property (strong, nonatomic) IBOutlet UIView *bacView;
@property (strong, nonatomic) IBOutlet UIButton *btnTwo;
@property (strong, nonatomic) IBOutlet UIButton *btnOne;
@property (strong, nonatomic) IBOutlet UIButton *btnThree;
@end

@implementation SwitchHouseType

+ (instancetype)insWithCallback:(void(^)(NSInteger))callback {
   SwitchHouseType *view =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    view.callback = callback;
    view.backgroundColor =[[UIColor colorWithHexString:@"000000"]colorWithAlphaComponent:0.777];
    return view;
}
- (IBAction)one:(id)sender {
    [self removeFromSuperview];
    self.callback(self.btnOne.tag);
}

- (IBAction)two:(id)sender {
    [self removeFromSuperview];
    self.callback(self.btnTwo.tag);
}

- (IBAction)three:(id)sender {
    [self removeFromSuperview];
    self.callback(self.btnThree.tag);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.bacView.layer.masksToBounds = YES;
    self.bacView.layer.cornerRadius = 8;
    self.btnOne.layer.masksToBounds = YES;
    self.btnOne.tag = 001;
    self.btnOne.layer.cornerRadius = 8;
    self.btnTwo.layer.masksToBounds = YES;
    self.btnTwo.tag = 002;
    self.btnTwo.layer.cornerRadius = 8;
    self.btnThree.layer.masksToBounds = YES;
    self.btnThree.tag = 003;
    self.btnThree.layer.cornerRadius = 8;
    
    
}


@end
