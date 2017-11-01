//
//  SPLanguageManager.h
//  SPChangeLanguages
//
//  Created by 刘鹏 on 2017/10/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SPLanguage;

@interface SPLanguageManager : NSObject

+ (instancetype)sharedLanguageManager;

@property (nonatomic, strong) NSArray *language_list;

@property (nonatomic, strong) NSArray *general_list;

@property (nonatomic, strong) NSDictionary *language_dict;

// 当前语言
- (NSString *)currentLanguage;
@property (nonatomic, assign) NSInteger currentLaguageIndex;

// 获取key 对应的当前语言的value
- (NSString *)getValue:(NSString *)key;

// 完成，更新设置语言页面数据
- (void)doneChangesLanguage:(SPLanguage *)language;

// 取消，还原数据
- (void)cancelChangesLanguage;

@end
