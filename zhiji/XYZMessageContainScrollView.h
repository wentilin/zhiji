//
//  XYZMessageContainScrollView.h
//  zhiji
//
//  Created by wentilin on 15/8/27.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYZMessageTableView.h"

@interface XYZMessageContainScrollView : UIScrollView
{
    XYZMessageTableView *notificationTableView;
    XYZMessageTableView *votesAndThanksTableView;
    XYZMessageTableView *contactsTableView;
}

@property (strong, nonatomic) XYZMessageTableView *notificationTableView;
@property (strong, nonatomic) XYZMessageTableView *votesAndThanksTableView;
@property (strong, nonatomic) XYZMessageTableView *contactsTableView;

@end
