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

@implementation XYZDiscoveryContainScrollView

@synthesize leftTableView;
@synthesize middleTableView;
@synthesize rightTableView;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect tmp = frame;
        tmp.origin.y = 0.0;
        tmp.origin.x = 10.0;
        tmp.size.width -= 20.0;
        leftTableView = [[UITableView alloc] initWithFrame:tmp style:UITableViewStyleGrouped];
        leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        leftTableView.backgroundColor = [UIColor clearColor];
        [self addSubview:leftTableView];
        
        tmp.origin.x = frame.origin.x + frame.size.width + 10.0;
        middleTableView = [[UITableView alloc] initWithFrame:tmp style:UITableViewStyleGrouped];
        middleTableView.backgroundColor = [UIColor clearColor];
        [self addSubview:middleTableView];
        
        tmp.origin.x = tmp.origin.x + frame.size.width;
        rightTableView = [[UITableView alloc] initWithFrame:tmp style:UITableViewStyleGrouped];
        rightTableView.backgroundColor = [UIColor clearColor];
        [self addSubview:rightTableView];
        
        leftTableView.dataSource = self;
        leftTableView.delegate = self;
        middleTableView.dataSource = self;
        middleTableView.delegate = self;
        rightTableView.dataSource = self;
        rightTableView.delegate = self;
    }
    return self;
}

#pragma data source for table view
- (NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    XYZDiscoveryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DISCOVERY_CELL_IDENTIFIER];
    
    if (cell == nil) {
        cell = [[XYZDiscoveryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DISCOVERY_CELL_IDENTIFIER];
    }
    
    cell.layer.cornerRadius = 10.0;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.questionLabel.text = @"问题一堆问题一堆问题一堆问题一堆问题一堆问题一堆问题一堆问题一堆问题一堆题一堆问题一堆问题一堆题一堆问题一堆问题一堆题一堆问题一堆问题一堆题一堆问题一堆问题一堆题一堆问题一堆问题一堆题一堆问题一堆问题一堆题一堆问题一堆问题一堆题一堆问题一堆问题一堆题一堆问题一堆问题一堆";
    
    cell.votesLabel.text = @"400";
    
    return cell;
}

#pragma remark - delegate for table view
- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 120.0;
}

@end
