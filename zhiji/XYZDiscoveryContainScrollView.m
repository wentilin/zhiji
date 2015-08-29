//
//  XYZContainView.m
//  zhiji
//
//  Created by wentilin on 15/8/18.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import "XYZDiscoveryContainScrollView.h"
#import "XYZDiscoveryTableViewCell.h"

#define DISCOVERY_CELL_IDENTIFIER @"DiscoveryCellIdentifier"

@interface XYZDiscoveryContainScrollView () {
}
@end

@implementation XYZDiscoveryContainScrollView

@synthesize leftTableView;
@synthesize middleTableView;
@synthesize rightTableView;
@synthesize advertiseImageView;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect tmp = frame;
        tmp.origin.y = 0.0;
        //tmp.origin.x = 10.0;
        //tmp.size.width -= 20.0;
        
        CGRect adFrame = self.bounds;
        adFrame.size.height = 200.0;
        advertiseImageView = [[UIImageView alloc] initWithFrame:adFrame];
        advertiseImageView.animationImages = @[[UIImage imageNamed:@"picture1"], [UIImage imageNamed:@"picture2"], [UIImage imageNamed:@"picture3"]];
        advertiseImageView.contentMode = UIViewContentModeScaleAspectFill;
        advertiseImageView.clipsToBounds = true;
        advertiseImageView.animationDuration = 2.0;
        [advertiseImageView startAnimating];
        
        leftTableView = [[UITableView alloc] initWithFrame:tmp style:UITableViewStyleGrouped];
        leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        leftTableView.backgroundColor = [UIColor clearColor];
        leftTableView.clipsToBounds = false;
        leftTableView.tableHeaderView = advertiseImageView;
        //[leftTableView addSubview:advertiseImageView];
        [self addSubview:leftTableView];
        
        tmp.origin.x = frame.origin.x + frame.size.width;
        middleTableView = [[UITableView alloc] initWithFrame:tmp style:UITableViewStyleGrouped];
        middleTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        middleTableView.backgroundColor = [UIColor clearColor];
        [self addSubview:middleTableView];
        
        tmp.origin.x = tmp.origin.x + frame.size.width;
        rightTableView = [[UITableView alloc] initWithFrame:tmp style:UITableViewStyleGrouped];
        rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        rightTableView.backgroundColor = [UIColor clearColor];
        [self addSubview:rightTableView];
    }
    return self;
}

@end
