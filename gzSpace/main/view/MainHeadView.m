//
//  MainHeadView.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/11.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "MainHeadView.h"
#import "UIButton+JKImagePosition.h"
#import "SpaceController.h"
#import "CycleImageView.h"
@interface MainHeadView()<CycleImageViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIButton *four;
@property (weak, nonatomic) IBOutlet UIButton *five;
@property (weak, nonatomic) IBOutlet UIButton *six;
@property (weak, nonatomic) IBOutlet UIButton *seven;
@property (weak, nonatomic) IBOutlet UIButton *eight;
@property (nonatomic, copy) void (^callback)(NSInteger);
@end
@implementation MainHeadView

+ (instancetype)ins:(void(^)(NSInteger))callback {
    MainHeadView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    view.callback = callback;
    return view;
}
-(void)awakeFromNib {
    [super awakeFromNib];
    CycleImageView *cycleImageView = [[CycleImageView alloc]initWithFrame:CGRectMake(0, 0,WIDTH, 165)];
    cycleImageView.images = @[[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"],[UIImage imageNamed:@"3"]];
    cycleImageView.delegate = self;
    [self addSubview:cycleImageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.one.tag = 401;
    self.two.tag = 402;
    self.three.tag = 403;
    self.four.tag = 404;
    self.five.tag = 405;
    self.six.tag = 406;
    self.seven.tag = 407;
    self.eight.tag = 408;
    [self.one jk_setImagePosition:2 spacing:10];
    [self.two jk_setImagePosition:2 spacing:10];
    [self.three jk_setImagePosition:2 spacing:10];
    [self.four jk_setImagePosition:2 spacing:10];
    [self.five jk_setImagePosition:2 spacing:10];
    [self.six jk_setImagePosition:2 spacing:10];
    [self.seven jk_setImagePosition:2 spacing:10];
    [self.eight jk_setImagePosition:2 spacing:10];
    
    self.one.layer.borderWidth = 0.5;
    self.one.layer.borderColor = [UIColor whiteColor].CGColor;
    self.one.layer.masksToBounds = YES;
    self.one.layer.cornerRadius = 17;
    self.two.layer.borderWidth = 0.5;
    self.two.layer.borderColor = [UIColor whiteColor].CGColor;
    self.two.layer.masksToBounds = YES;
    self.two.layer.cornerRadius = 17;
    self.three.layer.borderWidth = 0.5;
    self.three.layer.borderColor = [UIColor whiteColor].CGColor;
    self.three.layer.masksToBounds = YES;
    self.three.layer.cornerRadius = 17;
    self.four.layer.borderWidth = 0.5;
    self.four.layer.borderColor = [UIColor whiteColor].CGColor;
    self.four.layer.masksToBounds = YES;
    self.four.layer.cornerRadius = 17;
}

#pragma mark - CycleImageViewDelegate
- (void)didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
}

- (IBAction)btnAction:(id)sender {
    UIButton *btn = sender;
    if (btn == self.one) {
        NSLog(@"第一个按钮");
        self.callback(self.one.tag);
        
    }else if (btn == self.two){
         self.callback(self.two.tag);
        NSLog(@"第二个按钮");
    }else if (btn == self.three){
         self.callback(self.three.tag);
        NSLog(@"第三个按钮");
    }else if (btn == self.four){
        NSLog(@"第四个按钮");
         self.callback(self.four.tag);
    }else if (btn == self.five) {
        NSLog(@"第5个按钮");
         self.callback(self.five.tag);
    }else if (btn == self.six){
        NSLog(@"6个按钮");
         self.callback(self.six.tag);
    }else if (btn == self.seven){
        NSLog(@"第7个按钮");
         self.callback(self.seven.tag);
    }else if (btn == self.eight){
        NSLog(@"第8个按钮");
         self.callback(self.eight.tag);
    }
}


@end
