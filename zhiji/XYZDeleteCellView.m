//
//  XYZDeleteCellView.m
//  zhiji
//
//  Created by wentilin on 15/8/20.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import "XYZDeleteCellView.h"

@implementation XYZDeleteCellView

@synthesize tipLabel;
@synthesize tipImageView;

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        tipLabel = [[UILabel alloc] init];
        [self addSubview:tipLabel];
        tipImageView = [[UIImageView alloc] init];
        [self addSubview:tipImageView];
    }
    return self;
}

- (void)layoutSubviews {
    CGRect tmp = self.bounds;
    tmp.size.width /= 2;
    tmp.size.height /= 2;
    tmp.origin.x = self.bounds.size.width / 6;
    tmp.origin.y = self.bounds.size.height / 4;
    
    tipLabel.frame = tmp;
    tipLabel.font = [UIFont boldSystemFontOfSize:25.0];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.text = @"不再关注";
    
    tipImageView.frame = tmp;
    tipImageView.image = [UIImage imageNamed:@"eye_slash"];
    tipImageView.contentMode = UIViewContentModeLeft;
    tipImageView.clipsToBounds = true;
    tipImageView.hidden = true;
}

@end
