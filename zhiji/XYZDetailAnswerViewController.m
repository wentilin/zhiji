//
//  XYZDetailAnswerViewController.m
//  zhiji
//
//  Created by wentilin on 15/8/12.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import "XYZDetailAnswerViewController.h"
#import <WebKit/WebKit.h>

@interface XYZDetailAnswerViewController ()

@end

@implementation XYZDetailAnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *urlString = [[NSBundle mainBundle] pathForResource:@"answer" ofType:@"html"];
    NSString *contents = [NSString stringWithContentsOfFile:urlString encoding:NSUTF8StringEncoding error:nil];
    
    //NSURL *url = [[NSURL alloc] initWithString:urlString];
    WKWebView *answerView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [answerView loadHTMLString:contents baseURL:nil];
    [self.view addSubview:answerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
