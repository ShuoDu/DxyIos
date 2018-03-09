//
//  SendHouseController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/3/6.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "SendHouseController.h"
#import "UIColor+YYAdd.h"
#import "SwitchHouseType.h"
#import "CYXBaseRequest.h"
static NSString *rovedCellID = @"YDBAppRovedCell";
@interface SendHouseController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTab;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *upDataArray;
@property (nonatomic,strong) SwitchHouseType *switchView;
@property (nonatomic,strong) UITextField *contentTf;
@end

@implementation SendHouseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"房屋出租";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(sendMessage)];
    self.navigationItem.rightBarButtonItem = rightItem;
//     self.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"出租类型":@"请选择出租类型"},nil];
    self.dataArray = [[NSMutableArray alloc]initWithObjects:@{@"出租类型":@"请选择出租类型"},@{@"身份":@"请选择身份"},@{@"房屋地址":@"请输入房屋具体地址"},@{@"面积":@"请输入房屋具体面积/平米"},@{@"厅室":@"请输入厅室(如:2室1厅1卫)"},@{@"楼层":@"请输入楼层(如:3/9)"},@{@"电梯":@"有/无"},@{@"月租金":@"如:2000/押一付三"},@{@"联系人":@"请输入昵称"},@{@"联系人电话":@"请输入联系人电话"},nil];
    [self addTabView];
}

- (void)sendMessage {
    self.upDataArray = [[NSMutableArray alloc]init];
    for (int i =902; i<900+(self.dataArray.count); i++) {
        UITextField *field = [self.myTab viewWithTag:i];
        if (field.text == NULL || [field.text isEqualToString:@""]) {
            NSDictionary *dic = self.dataArray[i-900];
            NSString *tost = [NSString stringWithFormat:@"%@%@",@"请填写",dic.allKeys[0]];
            [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
            [SVProgressHUD showErrorWithStatus:tost];
        } else {
            [self.upDataArray addObject:field.text];
        }
    }
    if (self.upDataArray.count >3) {
//            NSDictionary *parm = @{@"type":self.upDataArray[0],@"shenfen":self.upDataArray[1],@"address":self.upDataArray[2],@"area":self.upDataArray[3],@"house_content":self.upDataArray[4],
//                  @"floor":self.upDataArray[5],@"lift":self.upDataArray[6],@"money":self.upDataArray[7],@"linkman":self.upDataArray[8],@"phone":self.upDataArray[9]
//                                   };
                NSDictionary *parm = @{@"type":self.upDataArray[0],@"address":self.upDataArray[2]};
                NSString *urls = [NSString stringWithFormat:@"%@%@",Host,@"main/add_message/"];
                [CYXHttpRequest get:urls params:parm success:^(id responseObj) {
                    NSLog(@"%@",responseObj);
                    NSDictionary *dff = [NSJSONSerialization JSONObjectWithData:responseObj options:NSJSONReadingMutableLeaves error:nil];
                    NSLog(@"返回数据%@",dff);
        
                } failure:^(NSError *error) {
                }];
                [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
                [SVProgressHUD showSuccessWithStatus:@"发布成功!"];
                [self.navigationController popViewControllerAnimated:YES];
    }
}



- (void)addTabView {
    self.myTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    self.myTab.dataSource = self;
    self.myTab.delegate = self;
    self.myTab.backgroundColor = NewViewBack;
    [self.myTab setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    [self.view addSubview:self.myTab];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:rovedCellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textColor = [UIColor colorWithHexString:@"666666"];
    NSDictionary *dic = self.dataArray[indexPath.row];
    NSString * key = dic.allKeys[0];
    cell.textLabel.text = key;
    if (indexPath.row == 0 || indexPath.row == 1) {
            UILabel * labContent = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-220, 0, 200, 60)];
            labContent.textAlignment = NSTextAlignmentRight;
            labContent.textColor =[UIColor lightGrayColor];
            labContent.font = [UIFont systemFontOfSize:14];
            labContent.text = dic[key];
            [cell addSubview:labContent];
    } else {
            self.contentTf = [[UITextField alloc]initWithFrame:CGRectMake(WIDTH-220, 0, 200, 60)];
            self.contentTf.placeholder = dic[key];
            self.contentTf.tag = 900+indexPath.row;
            self.contentTf.textAlignment = NSTextAlignmentRight;
            self.contentTf.font = [UIFont systemFontOfSize:14];
            [cell addSubview:self.contentTf];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSLog(@"点我干啥");
        self.switchView = [SwitchHouseType insWithCallback:^(NSInteger tag){
            if (tag == 001) {
                [self.dataArray removeObjectAtIndex:0];
                [self.dataArray insertObject:@{@"出租类型":@"整租"} atIndex:0];
                [self.myTab reloadData];
            } else if (tag == 002) {
                [self.dataArray removeObjectAtIndex:0];
                [self.dataArray insertObject:@{@"出租类型":@"合租"} atIndex:0];
                [self.myTab reloadData];
            } else if (tag == 003) {
                [self.dataArray removeObjectAtIndex:0];
                [self.dataArray insertObject:@{@"出租类型":@"短租/小时"} atIndex:0];
                [self.myTab reloadData];
            }
        }];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTouch)];
        [self.switchView addGestureRecognizer:tapGesture];
        self.switchView.frame = [UIScreen mainScreen].bounds;
        [self.view addSubview:self.switchView];
    }  if (indexPath.row == 1) {
        NSLog(@"点我干啥");
       self.switchView = [SwitchHouseType insWithCallback:^(NSInteger tag){
            if (tag == 001) {
                [self.dataArray removeObjectAtIndex:1];
                [self.dataArray insertObject:@{@"身份类型":@"个人"} atIndex:1];
                [self.myTab reloadData];
            } else if (tag == 002) {
                [self.dataArray removeObjectAtIndex:1];
                [self.dataArray insertObject:@{@"身份类型":@"中介"} atIndex:1];
                [self.myTab reloadData];
            } else if (tag == 003) {
                [self.dataArray removeObjectAtIndex:1];
                [self.dataArray insertObject:@{@"身份类型":@"公司"} atIndex:1];
                [self.myTab reloadData];
            }
        }];
        self.switchView.title.text = @"身份选择";
        [self.switchView.one setTitle:@"个人" forState:UIControlStateNormal];
        [self.switchView.two setTitle:@"中介" forState:UIControlStateNormal];
        [self.switchView.three setTitle:@"公司" forState:UIControlStateNormal];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTouch)];
        [self.switchView addGestureRecognizer:tapGesture];
        self.switchView.frame = [UIScreen mainScreen].bounds;
        [self.view addSubview:self.switchView];
    }
}

- (void)viewTouch {
    
    [self.switchView removeFromSuperview];
}


@end
