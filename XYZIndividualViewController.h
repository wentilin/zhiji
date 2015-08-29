//
//  IndividualViewController.h
//  zhiji
//
//  Created by wentilin on 15/8/28.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define INDIVIDUAL_CELL_IDENTIFIER @"IndividualCellIdentifier"

@interface XYZIndividualViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *individualTableView;
    NSMutableArray<NSDictionary *> *userDatas;
}

@property (strong, nonatomic) UITableView *individualTableView;
@property (copy, nonatomic) NSMutableArray<NSDictionary *> *userDatas;

@end
