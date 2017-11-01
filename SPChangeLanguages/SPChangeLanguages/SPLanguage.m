//
//  SPLanguage.m
//  SPChangeLanguages
//
//  Created by 刘鹏 on 2017/10/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SPLanguage.h"

@implementation SPLanguage

+ (instancetype)languageTitle:(NSString *)title key:(NSString *)key index:(NSInteger)index {
    
    SPLanguage *language = [[SPLanguage alloc] init];
    language.title = title;
    language.key = key;
    language.index = index;
    language.is_select = NO;
    return language;
}

@end
