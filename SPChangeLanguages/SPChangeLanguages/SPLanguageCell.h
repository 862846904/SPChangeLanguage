//
//  SPLanguageCell.h
//  SPChangeLanguages
//
//  Created by 刘鹏 on 2017/10/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SPLanguage;

@interface SPLanguageCell : UITableViewCell

+ (instancetype)languageWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@property (nonatomic, strong) SPLanguage *language;

@end
