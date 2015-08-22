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
    int count;
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
        count = 1;
        CGRect tmp = frame;
        tmp.origin.y = 0.0;
        tmp.origin.x = 10.0;
        tmp.size.width -= 20.0;
        
        CGRect adFrame = self.bounds;
        adFrame.origin.x -= 10.0;
        adFrame.size.height = 200.0;
        advertiseImageView = [[UIImageView alloc] initWithFrame:adFrame];
        advertiseImageView.animationImages = @[[UIImage imageNamed:@"picture1"], [UIImage imageNamed:@"picture2"], [UIImage imageNamed:@"picture3"]];
        advertiseImageView.contentMode = UIViewContentModeScaleAspectFill;
        advertiseImageView.clipsToBounds = true;
        advertiseImageView.animationDuration = 2.0;
        [advertiseImageView startAnimating];
        //[self addSubview:advertiseImageView];
        
        //tmp.origin.y += 200.0;
        leftTableView = [[UITableView alloc] initWithFrame:tmp style:UITableViewStyleGrouped];
        leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        leftTableView.backgroundColor = [UIColor clearColor];
        leftTableView.clipsToBounds = false;
        [leftTableView addSubview:advertiseImageView];
        [self addSubview:leftTableView];
        
        //tmp.origin.y -= 200.0;
        tmp.origin.x = frame.origin.x + frame.size.width + 10.0;
        middleTableView = [[UITableView alloc] initWithFrame:tmp style:UITableViewStyleGrouped];
        middleTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        middleTableView.backgroundColor = [UIColor clearColor];
        [self addSubview:middleTableView];
        
        tmp.origin.x = tmp.origin.x + frame.size.width;
        rightTableView = [[UITableView alloc] initWithFrame:tmp style:UITableViewStyleGrouped];
        rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    return 10;
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
    cell.questionLabel.text = @"什么是演技？普通观众如何甄别演技优劣?";
    
    cell.summaryAnswerLabel.text = @"同样是黑社会老大。在江湖告急里面，这个是有点逗比的黑社会老大任因九：在龙城岁月里面，这个是有勇无谋的黑社会老大大D：在黑金里面，这个是阴鸷霸气的黑社会老大周朝先：同样是大侠，在英雄本色里面，这个是背负血海深仇的林冲：在新龙门客栈里面，这个";
    
    cell.votesLabel.text = @"400";
    
    return cell;
}

#pragma remark - delegate for table view
- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 140.0;
}

- (CGFloat)tableView:(nonnull UITableView *)tableView estimatedHeightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 140.0;
}

@end
