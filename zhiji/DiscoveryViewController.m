//
//  DiscoveryViewController.m
//  zhiji
//
//  Created by wentilin on 15/8/13.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "XYZDiscoveryContainScrollView.h"
#import "XYZDiscoveryTableViewCell.h"

typedef NS_ENUM(NSInteger, TableViewOnDisplay) {
    LeftTableViewDisplayed,
    MiddleTableViewDisplayed,
    RightTableViewDisplayed
};

@interface DiscoveryViewController ()
{
    CGRect swipeViewFrame;
    CGFloat minX;
    CGFloat maxX;
    TableViewOnDisplay displayView;
}
@end

@implementation DiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initializeContainScrollView];
}

- (void)viewDidAppear:(BOOL)animated {
    swipeViewFrame = self.swipeView.frame;
    minX = self.tuijuanBtn.frame.origin.x;
    maxX = self.shoucangBtn.frame.origin.x;
}

- (void)initializeContainScrollView {
    [self.tuijuanBtn setAdjustsImageWhenHighlighted:false];
    [self.shoucangBtn setAdjustsImageWhenHighlighted:false];
    [self.remenBtn setAdjustsImageWhenHighlighted:false];
    
    UIPanGestureRecognizer *panGeusture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panToChoice:)];
    //[self.view addGestureRecognizer:panGeusture];
    
    CGRect frame = self.view.frame;
    frame.origin.y = self.cView.frame.origin.y + self.cView.frame.size.height;
    frame.size.height -= (frame.origin.y + 30.0);
    self.containScrollView = [[XYZDiscoveryContainScrollView alloc] initWithFrame:frame];
    self.containScrollView.delegate = self;
    [self.containScrollView removeGestureRecognizer:self.containScrollView.panGestureRecognizer];
    [self.containScrollView addGestureRecognizer:panGeusture];
    self.containScrollView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    self.containScrollView.contentSize = CGSizeMake(3*self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:self.containScrollView];
    
    self.containScrollView.leftTableView.dataSource = self;
    self.containScrollView.leftTableView.delegate = self;
    self.containScrollView.middleTableView.dataSource = self;
    self.containScrollView.middleTableView.delegate = self;
    self.containScrollView.rightTableView.dataSource = self;
    self.containScrollView.rightTableView.delegate = self;
    
    displayView = LeftTableViewDisplayed;
}

#pragma data source for table view
- (NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
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
   
    return 160.0;
}


- (void)panToChoice: (UIPanGestureRecognizer *)gesture {
    CGPoint translate = [gesture translationInView:self.containScrollView];
    //CGFloat velocityX = [gesture velocityInView:self.view].x;
    CGFloat x = MIN(maxX, MAX(minX, swipeViewFrame.origin.x + translate.x));
    CGRect frame = self.swipeView.frame;
    frame.origin.x = x;
    self.swipeView.frame = frame;
    
    switch (displayView) {
        case LeftTableViewDisplayed:
            [self.containScrollView setContentOffset:CGPointMake(translate.x, 0)];
            break;
        case MiddleTableViewDisplayed:
            [self.containScrollView setContentOffset:CGPointMake(self.view.frame.size.width + translate.x, 0)];
            break;
        case RightTableViewDisplayed:
            [self.containScrollView setContentOffset:CGPointMake(self.view.frame.size.width*2 + translate.x, 0)];
    }
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
            if (self.swipeView.center.x < self.view.frame.size.width/4) {
                self.swipeView.center = CGPointMake(self.tuijuanBtn.center.x, self.swipeView.center.y);
                [self.containScrollView setContentOffset:CGPointMake(0, 0) animated:false];
                displayView = LeftTableViewDisplayed;
            } else if (self.swipeView.center.x < 3*self.view.frame.size.width/4) {
                self.swipeView.center = CGPointMake(self.view.center.x, self.swipeView.center.y);
                [self.containScrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:false];
                displayView = MiddleTableViewDisplayed;
            } else {
                self.swipeView.center = CGPointMake(self.shoucangBtn.center.x, self.swipeView.center.y);
                [self.containScrollView setContentOffset:CGPointMake(self.view.frame.size.width*2, 0) animated:false];
                displayView = RightTableViewDisplayed;
            }
        } completion:^(BOOL finished){
            swipeViewFrame = self.swipeView.frame;
        }];
    }
}

- (IBAction)choiceTapped:(UIButton *)sender {
    NSString *title = sender.titleLabel.text;
    CGFloat centerY = self.swipeView.center.y;
    if ([title  isEqual: @"推荐"]) {
        self.swipeView.center = CGPointMake(self.tuijuanBtn.center.x, centerY);
        [self.containScrollView setContentOffset:CGPointMake(0, 0) animated:true];
    } else if ([title isEqual: @"热门"]) {
        self.swipeView.center = CGPointMake(self.remenBtn.center.x, centerY);
        [self.containScrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:true];
    } else {
        self.swipeView.center = CGPointMake(self.shoucangBtn.center.x, centerY);
        [self.containScrollView setContentOffset:CGPointMake(self.view.frame.size.width*2, 0) animated:true];
    }
}

@end
