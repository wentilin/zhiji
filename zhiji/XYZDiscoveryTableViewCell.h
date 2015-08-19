//
//  XYZDiscoveryTableViewCell.h
//  zhiji
//
//  Created by wentilin on 15/8/19.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZDiscoveryTableViewCell : UITableViewCell
{
    UILabel *questionLabel;
    UIButton *avatarBtn;
    UILabel *votesLabel;
    UILabel *summaryAnswerLabel;
    UIButton *arrowBtn;
    UILabel *seperator;
}

@property (strong, nonatomic) UILabel *questionLabel;
@property (strong, nonatomic) UIButton *avatarBtn;
@property (strong, nonatomic) UILabel *votesLabel;
@property (strong, nonatomic) UILabel *summaryAnswerLabel;
@property (strong, nonatomic) UIButton *arrowBtn;
@property (strong, nonatomic) UILabel *seperator;

@end
