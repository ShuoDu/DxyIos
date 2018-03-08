//
//  MessageTwoCell.m
//  gzSpace
//
//  Created by 智享单车 on 2018/2/9.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "MessageTwoCell.h"
#import "MainMessageModel.h"
@interface MessageTwoCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation MessageTwoCell
-(void)loadData:(MainMessageModel *)data{
    self.title.text = data.title;
    self.time.text = data.time;
    NSString * img_url = [NSString stringWithFormat:@"%@%@",ImgHost,data.message_img];
    NSLog(@"cell中图片地%@",img_url);
    [self.image sd_setImageWithURL:[NSURL URLWithString:img_url]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

@end
