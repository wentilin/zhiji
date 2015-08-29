//
//  XYZMessageContainScrollView.m
//  zhiji
//
//  Created by wentilin on 15/8/27.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import "XYZMessageContainScrollView.h"

@implementation XYZMessageContainScrollView

@synthesize notificationTableView;
@synthesize votesAndThanksTableView;
@synthesize contactsTableView;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect tmp = frame;
        tmp.origin.y = 0.0;
        
        notificationTableView = [[XYZMessageTableView alloc] initWithFrame:tmp style:UITableViewStylePlain];
        [self addSubview:notificationTableView];
        
        tmp.origin.x = frame.origin.x + frame.size.width;
        votesAndThanksTableView = [[XYZMessageTableView alloc] initWithFrame:tmp style:UITableViewStylePlain];
        [self addSubview:votesAndThanksTableView];
        
        tmp.origin.x = tmp.origin.x + frame.size.width;
        contactsTableView = [[XYZMessageTableView alloc] initWithFrame:tmp style:UITableViewStylePlain];
        [self addSubview:contactsTableView];
    }
    return self;
}

@end
