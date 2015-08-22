//
//  XYZHomeTableViewCell.h
//  zhiji
//
//  Created by wentilin on 15/8/11.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYZDeleteCellView;

@interface XYZHomeTableViewCell : UITableViewCell {
    UIPanGestureRecognizer *deleteCellGesture;
    UISwipeGestureRecognizer *swipeDeleteCellGesture;
    XYZDeleteCellView *deleteView;
    BOOL canBeDeleted;
}

@property (weak, nonatomic) IBOutlet UIButton *topicOrPeopleBtn;
@property (weak, nonatomic) IBOutlet UILabel *topicLabel;
@property (weak, nonatomic) IBOutlet UILabel *votesLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UIButton *avatarBtn;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) UIPanGestureRecognizer *deleteCellGesture;
@property (strong, nonatomic) XYZDeleteCellView *deleteView;
@property (assign, nonatomic) BOOL canBeDeleted;
@property (readonly, nonatomic) UISwipeGestureRecognizer *swipeDeleteCellGesture;

- (void)initializeSubviews;

@end
