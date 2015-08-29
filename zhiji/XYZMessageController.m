//
//  XYZMessageController.m
//  zhiji
//
//  Created by wentilin on 15/8/27.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import "XYZMessageController.h"
#import "XYZMessageContainScrollView.h"

@interface XYZMessageController ()
{
    CGRect swipeViewFrame;
    CGFloat minX;
    CGFloat maxX;
    TableViewOnDisplay displayView;
}
@end

@implementation XYZMessageController

@synthesize containScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeContainScrollView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    swipeViewFrame = self.sliderView.frame;
    minX = self.notificationBtn.frame.origin.x;
    maxX = self.contactsBtn.frame.origin.x;
}

- (void)initializeContainScrollView {
    UIPanGestureRecognizer *panGeusture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panToChoice:)];
    
    CGRect frame = self.view.frame;
    frame.origin.y = self.barView.frame.origin.y + self.barView.frame.size.height;
    frame.size.height -= (frame.origin.y + 30.0);
    self.containScrollView = [[XYZMessageContainScrollView alloc] initWithFrame:frame];
    self.containScrollView.delegate = self;
    [self.containScrollView removeGestureRecognizer:self.containScrollView.panGestureRecognizer];
    [self.containScrollView addGestureRecognizer:panGeusture];
    self.containScrollView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    self.containScrollView.contentSize = CGSizeMake(3*self.view.bounds.size.width, self.view.bounds.size.height);
    
    self.containScrollView.notificationTableView.dataSource = self;
    self.containScrollView.notificationTableView.delegate = self;
    self.containScrollView.votesAndThanksTableView.dataSource = self;
    self.containScrollView.votesAndThanksTableView.delegate = self;
    self.containScrollView.contactsTableView.dataSource = self;
    self.containScrollView.contactsTableView.delegate = self;
    
    [self.view addSubview:self.containScrollView];
    
    displayView = LeftTableViewDisplayed;
}

- (void)panToChoice:(UIPanGestureRecognizer *)gesture {
    CGPoint translate = [gesture translationInView:self.containScrollView];
    //CGFloat velocityX = [gesture velocityInView:self.view].x;
    CGFloat x = MIN(maxX, MAX(minX, swipeViewFrame.origin.x + translate.x));
    CGRect frame = self.sliderView.frame;
    frame.origin.x = x;
    self.sliderView.frame = frame;
    
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
            if (self.sliderView.center.x < self.view.frame.size.width/4) {
                self.sliderView.center = CGPointMake(self.notificationBtn.center.x, self.sliderView.center.y);
                [self.containScrollView setContentOffset:CGPointMake(0, 0) animated:false];
                displayView = LeftTableViewDisplayed;
            } else if (self.sliderView.center.x < 3*self.view.frame.size.width/4) {
                self.sliderView.center = CGPointMake(self.view.center.x, self.sliderView.center.y);
                [self.containScrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:false];
                displayView = MiddleTableViewDisplayed;
            } else {
                self.sliderView.center = CGPointMake(self.contactsBtn.center.x, self.sliderView.center.y);
                [self.containScrollView setContentOffset:CGPointMake(self.view.frame.size.width*2, 0) animated:false];
                displayView = RightTableViewDisplayed;
            }
        } completion:^(BOOL finished){
            swipeViewFrame = self.sliderView.frame;
        }];
    }
}

#pragma mark data source for table view
- (NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView {
    return 20;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MESSAGE_CELL_IDENTIFIRER"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MESSAGE_CELL_IDENTIFIRER"];
    }
    
    cell.layer.cornerRadius = 10.0;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"什么是演技？普通观众如何甄别演技优劣?";
    
    return cell;
}

#pragma mark - delegate for table view
- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 140.0;
}

- (CGFloat)tableView:(nonnull UITableView *)tableView estimatedHeightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 140.0;
}

- (IBAction)choiceTapped:(UIButton *)sender {
    NSString *title = sender.titleLabel.text;
    CGFloat centerY = self.sliderView.center.y;
    if ([title  isEqual: @"通知"]) {
        self.sliderView.center = CGPointMake(self.notificationBtn.center.x, centerY);
        [self.containScrollView setContentOffset:CGPointMake(0, 0) animated:true];
    } else if ([title isEqual: @"赞与感谢"]) {
        self.sliderView.center = CGPointMake(self.votesAndThanksBtn.center.x, centerY);
        [self.containScrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:true];
    } else {
        self.sliderView.center = CGPointMake(self.contactsBtn.center.x, centerY);
        [self.containScrollView setContentOffset:CGPointMake(self.view.frame.size.width*2, 0) animated:true];
    }
}
@end
