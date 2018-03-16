//
//  SpaceModel.h
//  gzSpace
//
//  Created by 智享单车 on 2018/2/28.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpaceModel : NSObject<YYModel>
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSDictionary *img_url;
@end
