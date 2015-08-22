//
//  XYZContainView.h
//  zhiji
//
//  Created by wentilin on 15/8/18.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface XYZDiscoveryContainScrollView : UIScrollView <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *leftTableView;
    UITableView *middleTableView;
    UITableView *rightTableView;
    UIImageView *advertiseImageView;
}

@property (strong, nonatomic) UITableView *leftTableView;
@property (strong, nonatomic) UITableView *middleTableView;
@property (strong, nonatomic) UITableView *rightTableView;
@property (strong, nonatomic) UIImageView *advertiseImageView;

@end
