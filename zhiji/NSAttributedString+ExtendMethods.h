//
//  NSAttributedString+ExtendMethods.h
//  zhiji
//
//  Created by wentilin on 15/8/20.
//  Copyright © 2015年 wentilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (ExtendMethods)

+ (CGSize)fontSizeWithAttributeString:(NSString *)str font:(UIFont *)font size:(CGSize)size;

@end
