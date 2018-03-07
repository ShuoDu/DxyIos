//
//  SwitchHouseType.h
//  gzSpace
//
//  Created by 智享单车 on 2018/3/7.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchHouseType : UIView
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIButton *one;
@property (strong, nonatomic) IBOutlet UIButton *two;
@property (strong, nonatomic) IBOutlet UIButton *three;

+ (instancetype)insWithCallback:(void(^)(NSInteger))callback;
@end
