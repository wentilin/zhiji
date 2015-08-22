//
//  XYZHomeTableViewController.m
//  zhiji
//
//  Created by wentilin on 15/8/11.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import "XYZHomeTableViewController.h"
#import "XYZHomeTableViewCell.h"
#import "XYZDetailAnswerViewController.h"
#import "XYZPeopleViewController.h"
#import "XYZTopicViewController.h"

@interface XYZHomeTableViewController ()
{
    BOOL isLoading;
    UIActivityIndicatorView *moreDatasInicator;
}
@end

@implementation XYZHomeTableViewController

@synthesize datas;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.navigationController.tabBarController.tabBar.tintColor = [UIColor blueColor];
    self.navigationController.tabBarItem.image = [UIImage imageNamed:@"home_pic.png"];
    //self.navigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"home_pic_seleted.png"];
    
    datas = [NSMutableArray arrayWithObjects:@"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", nil];
    
    isLoading = false;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteCell:) name:@"DeleteCellNotifiction" object:nil];
}

- (void)deleteCell:(NSNotification *)notifction {
    XYZHomeTableViewCell *cell = (XYZHomeTableViewCell *)notifction.object;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [datas removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYZHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QAQCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[XYZHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QAQCell"];
    }
    
    cell.questionLabel.text = @"什么是演技？普通观众如何甄别演技优劣?普通观众如何甄别演技优劣?什么是演技？普通观众如何甄别演技优劣?普通观众如何甄别演技优劣?什么是演技？普通观众如何甄别演技优劣?普通观众如何甄别演技优劣?什么是演技？普通观众如何甄别演技优劣?普通观众如何甄别演技优劣?什么是演技？普通观众如何甄别演技优劣?普通观众如何甄别演技优劣?";
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:cell.questionLabel.text];
    NSRange range = NSMakeRange(0, attStr.length);
    [attStr addAttribute:NSFontAttributeName value:cell.questionLabel.font range:range];

    NSDictionary *dic = [attStr attributesAtIndex:0 effectiveRange:&range];
    CGSize size = [cell.questionLabel.text boundingRectWithSize:CGSizeMake(cell.questionLabel.frame.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    CGRect qRect = cell.questionLabel.frame;
    cell.questionLabel.frame = CGRectMake(qRect.origin.x, qRect.origin.y
                                          , qRect.size.width, size.height);
    
    cell.votesLabel.layer.cornerRadius = 5.0f;
    cell.votesLabel.layer.backgroundColor = [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1].CGColor;
    cell.votesLabel.clipsToBounds = true;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - Table view delegate
- (void)scrollViewDidEndDragging:(nonnull UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height)) {
        if (!isLoading) {
            isLoading = true;
            moreDatasInicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 10, 20, 60)];
            [moreDatasInicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
            moreDatasInicator.hidesWhenStopped = true;
            [moreDatasInicator startAnimating];
            self.tableView.tableFooterView = moreDatasInicator;
            
            [self loadDatas];
        }
    }
}

- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    XYZDetailAnswerViewController *answerController = [[XYZDetailAnswerViewController alloc] init];
    [self.navigationController pushViewController:answerController animated:true];
}

- (void)loadDatas {
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [datas addObjectsFromArray:@[@"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [moreDatasInicator stopAnimating];
            moreDatasInicator = nil;
            self.tableView.tableFooterView = nil;
            isLoading = false;
        });
    });
}

- (IBAction)showTopicOrPeople:(id)sender {
    XYZTopicViewController *topic = [[XYZTopicViewController alloc] init];
    [self.navigationController pushViewController:topic animated:true];
}

@end
