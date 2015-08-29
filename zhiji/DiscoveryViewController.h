//
//  DiscoveryViewController.h
//  zhiji
//
//  Created by wentilin on 15/8/13.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DISCOVERY_CELL_IDENTIFIER @"DiscoveryCellIdentifier"

@class XYZDiscoveryContainScrollView;

@interface DiscoveryViewController : UIViewController<UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *tuijuanBtn;
@property (weak, nonatomic) IBOutlet UIButton *remenBtn;
@property (weak, nonatomic) IBOutlet UIButton *shoucangBtn;
@property (weak, nonatomic) IBOutlet UIView *swipeView;
@property (weak, nonatomic) IBOutlet UIView *cView;
@property (strong, nonatomic) XYZDiscoveryContainScrollView *containScrollView;

- (IBAction)choiceTapped:(UIButton *)sender;
- (void)initializeContainScrollView;
@end
