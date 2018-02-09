//
//  MainMessageTool.m
//  gzSpace
//
//  Created by 智享单车 on 2018/2/8.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "MainMessageTool.h"
@interface MainMessageTool()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic, copy) void (^callback)(NSInteger);
@end
@implementation MainMessageTool

+ (instancetype)ins:(void(^)(NSInteger))callback {
    MainMessageTool *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    view.callback = callback;
    return view;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    CGRect tableViewRect = CGRectMake(0.0, 0.0, 50.0, 320.0);
    self.myTable = [[UITableView alloc] initWithFrame:tableViewRect style:UITableViewStylePlain];
    self.myTable.center = CGPointMake(WIDTH/2, HEIGHT/2);
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    //tableview逆时针旋转90度。
    self.myTable.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    // scrollbar 不显示
    self.myTable.showsVerticalScrollIndicator = NO;
    [self addSubview:self.myTable];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}
- (UITableViewCell *)tableView :( UITableView *)aTableView cellForRowAtIndexPath :( NSIndexPath*)indexPath {
    
    UITableViewCell *cell  =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.textLabel.text = @"头条";
    return cell;
}

@end
