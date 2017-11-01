//
//  SPLanguageManager.m
//  SPChangeLanguages
//
//  Created by 刘鹏 on 2017/10/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SPLanguageManager.h"
#import "SPLanguage.h"
#import "AppDelegate.h"

@implementation SPLanguageManager

+ (instancetype)sharedLanguageManager {
    
    static SPLanguageManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SPLanguageManager alloc] init];
        [manager updateData];
    });
    return manager;
}

// 更新语言页面数据
- (void)changesLanguageList {
    
    self.language_list = @[[SPLanguage languageTitle:ZH_HANS_CN_VALUE key:ZH_HANS_CN_KEY index:0],
                           [SPLanguage languageTitle:ZH_HANS_HK_VALUE key:ZH_HANS_HK_KEY index:1],
                           [SPLanguage languageTitle:EN_VALUE key:EN_KEY index:2]
                           ];
    
    NSString *language = [self currentLanguage];
    for (SPLanguage *lan in self.language_list) {
        
        if ([lan.key isEqualToString:language]) {
            lan.is_select = YES;
            self.currentLaguageIndex = lan.index;
            break;
        }
    }
}

// 完成更改语言
- (void)doneChangesLanguage:(SPLanguage *)language {
    
    // 更新存储在本地的值
    [[NSUserDefaults standardUserDefaults] setObject:language.key forKey:@"appLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // 完成，更新所有数据
    [self updateData];
    
    // 重新加载
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate mainVC:YES];
}

// 取消更改语言，还原数据
- (void)cancelChangesLanguage {
    
    for (SPLanguage *language in self.language_list) {
        language.is_select = NO;
        if (language.index == self.currentLaguageIndex) {
            language.is_select = YES;
        }
    }
}

// 获取当前语言
- (NSString *)currentLanguage {
    
    NSString *language = [[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"];
    if (!language) {
        
        // 获取系统语言
        // NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        // NSString *languageName = [appLanguages objectAtIndex:0];
        
        // 默认简体中文
        [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans-CN" forKey:@"appLanguage"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        language = @"zh-Hans-CN";
    }
    return language;
}

// 获取key 对应的语言值
- (NSString *)getValue:(NSString *)key {
    
    // 程序跟随系统语言获取方式
    // @"TITLE"：对应值的Key
    // @"Language"：获取文件名称
    // NSString *title = NSLocalizedStringFromTable(@"TITLE", @"Language", nil);
    return [self getValue:key language:nil];
}

// key：要获取的值对应的key
// language：获取的语言
- (NSString *)getValue:(NSString *)key language:(NSString *)language {
    
    if (!language) {
        language = [self currentLanguage];
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    return [[NSBundle bundleWithPath:path] localizedStringForKey:(key) value:nil table:@"Language"];
}

// 更新所有语言相关数据
- (void)updateData {
    
    // 获取当前选择的语言
    NSString *language = [self currentLanguage];
    
    // 获取语言对应的所有值
    NSString *SET_TITLE_V         = [self getValue:SET_TITLE language:language];
    NSString *GENERAL_TITLE_V     = [self getValue:GENERAL_TITLE language:language];
    NSString *LANGUAGE_TITLE_V    = [self getValue:LANGUAGE_TITLE language:language];
    NSString *LANGUAGE_V          = [self getValue:LANGUAGE language:language];
    NSString *TEXT_SIZE_V         = [self getValue:TEXT_SIZE language:language];
    NSString *BACKGROUND_V        = [self getValue:BACKGROUND language:language];
    NSString *MY_STICKERS_V       = [self getValue:MY_STICKERS language:language];
    NSString *PHOROS_AND_VIDEOS_V = [self getValue:PHOROS_AND_VIDEOS language:language];
    NSString *CANCEL_V            = [self getValue:CANCEL language:language];
    NSString *DONE_V              = [self getValue:DONE language:language];
    
    self.general_list = @[@[LANGUAGE_V],
                          @[TEXT_SIZE_V, BACKGROUND_V, MY_STICKERS_V, PHOROS_AND_VIDEOS_V]];
    
    // 将所有值用键值对方式保存，方便外部读取
    self.language_dict = @{SET_TITLE:           SET_TITLE_V,
                           GENERAL_TITLE:       GENERAL_TITLE_V,
                           LANGUAGE_TITLE:      LANGUAGE_TITLE_V,
                           LANGUAGE:            LANGUAGE_V,
                           TEXT_SIZE:           TEXT_SIZE_V,
                           BACKGROUND:          BACKGROUND_V,
                           MY_STICKERS:         MY_STICKERS_V,
                           PHOROS_AND_VIDEOS:   PHOROS_AND_VIDEOS_V,
                           CANCEL:              CANCEL_V,
                           DONE:                DONE_V
                           };
    
    // 更新语言界面数据
    [self changesLanguageList];
}

@end
