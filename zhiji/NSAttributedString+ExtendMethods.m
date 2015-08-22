//
//  NSAttributedString+ExtendMethods.m
//  zhiji
//
//  Created by wentilin on 15/8/20.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import "NSAttributedString+ExtendMethods.h"

@implementation NSAttributedString (ExtendMethods)

+ (CGSize)fontSizeWithAttributeString:(NSString *)str font:(UIFont *)font size:(CGSize)size {
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:font}];
    CGSize sizeOfRect = [attrString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    
    return sizeOfRect;
}

@end
