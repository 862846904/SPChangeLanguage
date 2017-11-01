//
//  SPGeneralCell.h
//  SPChangeLanguages
//
//  Created by 刘鹏 on 2017/10/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPGeneralCell : UITableViewCell

+ (instancetype)generalWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@property (nonatomic, copy) NSString *title;

@end
