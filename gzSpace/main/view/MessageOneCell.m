//
//  MessageOneCell.m
//  gzSpace
//
//  Created by 智享单车 on 2018/2/8.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "MessageOneCell.h"
#import "MainMessageModel.h"
@interface MessageOneCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end
@implementation MessageOneCell

-(void)loadData:(MainMessageModel *)data{
    self.title.text = data.title;
    self.time.text = data.time;
    [self.img sd_setImageWithURL:[NSURL URLWithString:data.message_img]];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



@end
