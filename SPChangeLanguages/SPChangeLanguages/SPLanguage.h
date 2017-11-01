//
//  SPLanguage.h
//  SPChangeLanguages
//
//  Created by 刘鹏 on 2017/10/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPLanguage : NSObject

+ (instancetype)languageTitle:(NSString *)title key:(NSString *)key index:(NSInteger)index;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) BOOL is_select;

@end
