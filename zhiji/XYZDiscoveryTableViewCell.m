//
//  XYZDiscoveryTableViewCell.m
//  zhiji
//
//  Created by wentilin on 15/8/19.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import "XYZDiscoveryTableViewCell.h"
#import "NSAttributedString+ExtendMethods.h"

@implementation XYZDiscoveryTableViewCell

@synthesize questionLabel;
@synthesize avatarBtn;
@synthesize votesLabel;
@synthesize summaryAnswerLabel;
@synthesize arrowBtn;
@synthesize seperator;

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        questionLabel = [[UILabel alloc] init];
        questionLabel.numberOfLines = 2;
        [self addSubview:questionLabel];
        
        arrowBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
        [arrowBtn setImage:[UIImage imageNamed:@"arrow_pic"] forState:UIControlStateNormal];
        [arrowBtn addTarget:self action:@selector(arrowBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:arrowBtn];
        
        avatarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        avatarBtn.clipsToBounds = true;
        [avatarBtn setImage:[UIImage imageNamed:@"movie"] forState:UIControlStateNormal];
        [self addSubview:avatarBtn];
        
        seperator = [[UILabel alloc] init];
        seperator.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:seperator];
        
        votesLabel = [[UILabel alloc] init];
        votesLabel.layer.backgroundColor = [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1].CGColor;
        [self addSubview:votesLabel];
        
        summaryAnswerLabel = [[UILabel alloc] init];
        summaryAnswerLabel.numberOfLines = 4;
        [self addSubview:summaryAnswerLabel];
        
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    frame.size.width -= 40.0;
    frame.origin.x += 20.0;
    frame.size.height += 10.0;
    [super setFrame:frame];
    
}

- (void)layoutSubviews {
    CGRect tmp = self.bounds;
    tmp.origin.x += 10.0;
    tmp.origin.y += 10.0;
    
    questionLabel.font = [UIFont boldSystemFontOfSize:17.0];
    CGSize qSize = [NSAttributedString fontSizeWithAttributeString:questionLabel.text font:questionLabel.font size:CGSizeMake(tmp.size.width-60.0, 42.0)];
    questionLabel.frame = CGRectMake(10.0, 10.0, tmp.size.width-60.0, qSize.height);
    
    tmp.size.height = questionLabel.frame.size.height;
    tmp.size.width -= 10.0;
    arrowBtn.frame = tmp;
    CGFloat left = arrowBtn.bounds.size.width - 60.0;
    arrowBtn.imageEdgeInsets = UIEdgeInsetsMake(0.0, left, 0.0, 0.0);
    arrowBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    seperator.frame = CGRectMake(0.0, questionLabel.bounds.size.height+10.0+5.0, self.bounds.size.width, 1.0);
    
    CGFloat avatarY = seperator.frame.origin.y + seperator.frame.size.height + 5.0;
    avatarBtn.frame = CGRectMake(10.0, avatarY, 30.0, 30.0);
    avatarBtn.layer.cornerRadius = 15.0;
    
    
    CGFloat votesY = avatarBtn.frame.origin.y + avatarBtn.frame.size.height + 5.0;
    votesLabel.frame = CGRectMake(10.0, votesY, 30.0, 30.0);
    votesLabel.layer.cornerRadius = 5.0;
    NSAttributedString *fontAttr = [[NSAttributedString alloc] initWithString:votesLabel.text attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [votesLabel sizeToFit];
    votesLabel.attributedText = fontAttr;
    
    CGFloat x = 10.0+votesLabel.bounds.size.width+10.0;
    summaryAnswerLabel.font = [UIFont systemFontOfSize:17.0];
    CGSize sSize = [NSAttributedString fontSizeWithAttributeString:summaryAnswerLabel.text font:summaryAnswerLabel.font size:CGSizeMake(tmp.size.width-x-10.0, 84.0)];
    summaryAnswerLabel.frame = CGRectMake(x, avatarY, tmp.size.width-x-10.0, sSize.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)arrowBtnTapped:(UIButton *)sender {
    NSLog(@"tapped");
}

@end
