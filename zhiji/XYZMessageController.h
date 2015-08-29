//
//  XYZMessageController.h
//  zhiji
//
//  Created by wentilin on 15/8/27.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TableViewOnDisplay) {
    LeftTableViewDisplayed,
    MiddleTableViewDisplayed,
    RightTableViewDisplayed
};

@class XYZMessageContainScrollView;

@interface XYZMessageController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    XYZMessageContainScrollView *containScrollView;
}
@property (weak, nonatomic) IBOutlet UIButton *notificationBtn;
@property (weak, nonatomic) IBOutlet UIButton *votesAndThanksBtn;
@property (weak, nonatomic) IBOutlet UIButton *contactsBtn;
@property (weak, nonatomic) IBOutlet UIView *barView;
@property (weak, nonatomic) IBOutlet UIView *sliderView;
@property (strong, nonatomic) XYZMessageContainScrollView *containScrollView;

- (IBAction)choiceTapped:(UIButton *)sender;

@end
