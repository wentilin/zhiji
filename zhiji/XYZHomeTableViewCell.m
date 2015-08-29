//
//  XYZHomeTableViewCell.m
//  zhiji
//
//  Created by wentilin on 15/8/11.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import "XYZHomeTableViewCell.h"
#import "XYZDeleteCellView.h"

@interface XYZHomeTableViewCell() {
    BOOL isScaling;
    //UITableView *cellContainer;
}

@end

@implementation XYZHomeTableViewCell

@synthesize deleteCellGesture;
@synthesize deleteView;
@synthesize canBeDeleted;
@synthesize swipeDeleteCellGesture;
@synthesize cellContainer;

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initializeSubviews];
    }
    
    return self;
}



- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initializeSubviews];
    }
    
    return self;
}

- (void)initializeSubviews {
    deleteView = [[XYZDeleteCellView alloc] init];
    //deleteView.hidden = true;
    [self addSubview:deleteView];
    
//    deleteCellGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(deleteCell:)];
//    [self addGestureRecognizer:deleteCellGesture];
    
//    swipeDeleteCellGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDeleteCell:)];
//    swipeDeleteCellGesture.direction = UISwipeGestureRecognizerDirectionLeft;
//    [self addGestureRecognizer:swipeDeleteCellGesture];
    
    self.clipsToBounds = false;
    isScaling = false;
    canBeDeleted = false;
    
    self.votesLabel.layer.backgroundColor = [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1].CGColor;
}

- (void)deleteCell:(UIPanGestureRecognizer *)gesture {
    CGPoint point = [gesture locationInView:cellContainer];
    if (self == [cellContainer cellForRowAtIndexPath:[cellContainer indexPathForRowAtPoint:point]]) {
        CGRect __block tmp = self.bounds;
        CGPoint translate = [gesture translationInView:self];
        CGFloat deleteViewX = tmp.size.width;
        tmp.origin.x = deleteViewX;
        deleteView.frame = tmp;
        
        CGFloat cellX = MIN(0.0, translate.x);
        self.frame = CGRectMake(cellX, self.frame.origin.y, tmp.size.width, tmp.size.height);
        
        if (-translate.x > tmp.size.width/2) {
            deleteView.tipImageView.hidden = false;
            deleteView.tipLabel.hidden = true;
            //        if (!isScaling) {
            //            isScaling = true;
            //            [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.08 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
            //                deleteView.tipImageView.transform = CGAffineTransformMakeScale(1.5, 1.5);
            //            } completion:^(BOOL finished) {
            //                deleteView.tipImageView.transform = CGAffineTransformIdentity;
            //            }];
            //        }
        } else {
            deleteView.tipImageView.hidden = true;
            deleteView.tipLabel.hidden = false;
        }
        
        if (gesture.state == UIGestureRecognizerStateEnded) {
            if (!deleteView.tipImageView.hidden) {
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                    self.frame = CGRectMake(-tmp.size.width, self.frame.origin.y, tmp.size.width, tmp.size.height);
                    deleteView.frame = tmp;
                } completion:^(BOOL completed){
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"DeleteCellNotifiction" object:self];
                }];
            } else {
                [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                    self.frame = CGRectMake(0.0, self.frame.origin.y, tmp.size.width, tmp.size.height);
                    tmp.origin.x = self.bounds.size.width;
                    deleteView.frame = tmp;
                } completion:^(BOOL completed){
                    isScaling = false;
                }];
            }
        }
    }
}

- (void)swipeDeleteCell:(UISwipeGestureRecognizer *)gesture {
    NSLog(@"swiping...");
    deleteView.hidden = false;
    CGRect finalCellFrame = self.frame;
    finalCellFrame.origin.x = -self.bounds.size.width;
    CGRect finalDeleteViewFrame = deleteView.frame;
    finalDeleteViewFrame.origin.x = self.bounds.size.width;
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = finalCellFrame;
        deleteView.frame = finalDeleteViewFrame;
    } completion:^(BOOL finished) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DeleteCellNotifiction" object:self];
    }];
    
}

- (void)layoutSubviews {
    
    CGRect tmp = self.bounds;
    tmp.origin.x = tmp.size.width;
    deleteView.frame = tmp;
    deleteView.backgroundColor = [UIColor redColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
