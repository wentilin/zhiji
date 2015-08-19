//
//  XYZHomeTableViewController.h
//  zhiji
//
//  Created by wentilin on 15/8/11.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZHomeTableViewController : UITableViewController
{
    NSMutableArray *datas;
}

@property (nonatomic, retain) NSMutableArray *datas;

- (void)loadDatas;
- (IBAction)showTopicOrPeople:(id)sender;

@end
