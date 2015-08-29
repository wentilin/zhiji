//
//  IndividualViewController.m
//  zhiji
//
//  Created by wentilin on 15/8/28.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import "XYZIndividualViewController.h"
#import "XYZIndivualTableViewCell.h"

@implementation XYZIndividualViewController

@synthesize individualTableView;
@synthesize userDatas;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect tableViewFrame = self.view.bounds;
//    if ([[UIDevice currentDevice].model  isEqual: @"iPhone"]) {
//        tableViewFrame.origin.y += 60.0;
//    }
//    tableViewFrame.size.height -= 40.0;
    individualTableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    individualTableView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    individualTableView.dataSource = self;
    individualTableView.delegate = self;
    
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    individualTableView.tableFooterView = footerView;
    
    [self.view addSubview:individualTableView];
    
    individualTableView.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:individualTableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    NSLayoutConstraint *c2 = nil;
    NSLayoutConstraint *c3 = nil;
    if ([[UIDevice currentDevice].model  isEqual: @"iPhone"]) {
        c2 = [NSLayoutConstraint constraintWithItem:individualTableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:40.0];
        c3 = [NSLayoutConstraint constraintWithItem:individualTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:60.0];
    } else {
        c2 = [NSLayoutConstraint constraintWithItem:individualTableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
        c3 = [NSLayoutConstraint constraintWithItem:individualTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    }
    
    NSLayoutConstraint *c4 = [NSLayoutConstraint constraintWithItem:individualTableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    [self.view addConstraints:@[c1, c2, c3, c4]];
    
    NSDictionary *userInformation = @{ @"Wenti Lin":@"avatar_pic"};
    NSDictionary *userContents = @{@"我的关注":@"focus_pic", @"我的收藏":@"collection_pic.png", @"我的草稿":@"draft_pic"};
    NSDictionary *systemSettings = @{@"反馈帮助中心":@"suggestion_help_pic", @"夜间模式":@"night_model_pic", @"设置":@"settings_pic"};
    
    userDatas = [NSMutableArray arrayWithArray:@[userInformation, userContents, systemSettings]];
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"rorated");
    [individualTableView reloadData];
}

#pragma mark data source for table view
- (NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView {
    return userDatas.count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dic = userDatas[section];
    return dic.allKeys.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    XYZIndivualTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:INDIVIDUAL_CELL_IDENTIFIER];
    
    if (cell == nil) {
        cell = [[XYZIndivualTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:INDIVIDUAL_CELL_IDENTIFIER];
    }
    
    NSDictionary *dic = userDatas[indexPath.section];
    switch (indexPath.section) {
        case 0:
            cell.imageView.layer.cornerRadius = 50.0;
            cell.imageView.clipsToBounds = true;
            cell.imageView.image = [UIImage imageNamed:dic.allValues[0]];
            cell.textLabel.text = dic.allKeys[0];
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:dic.allValues[indexPath.row]];
            cell.textLabel.text = dic.allKeys[indexPath.row];
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:dic.allValues[indexPath.row]];
            cell.textLabel.text = dic.allKeys[indexPath.row];
            if ([cell.textLabel.text isEqualToString:@"夜间模式"]) {
                UISwitch *switchBtn = [[UISwitch alloc] init];
                switchBtn.center = CGPointMake(cell.bounds.size.width, cell.center.y+10);
                switchBtn.translatesAutoresizingMaskIntoConstraints = false;
                [cell addSubview:switchBtn];
                
                NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:switchBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
                NSLayoutConstraint *trailingContraint = [NSLayoutConstraint constraintWithItem:switchBtn attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:cell attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-40.0];
                [cell addConstraint:centerYConstraint];
                [cell addConstraint:trailingContraint];
            }
            break;
        default:
            break;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - delegate for table view
- (CGFloat)tableView:(nonnull UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    switch (section) {
        case 0:case 1:
            return 20.0;
            break;
            
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CGFloat height = 0.0;
    if ([[UIDevice currentDevice].model  isEqual: @"iPhone"]) {
        height = (tableView.bounds.size.height - 146.0) / 8;
    } else {
        height = (tableView.bounds.size.height - 160.0) / 8;
    }
    switch (indexPath.section) {
        case 0:
            return height * 2;
            break;
            
        case 1:
            return height;
            break;
        default:
            return height;
    }
}

@end
