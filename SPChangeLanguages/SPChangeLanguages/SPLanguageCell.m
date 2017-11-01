//
//  SPLanguageCell.m
//  SPChangeLanguages
//
//  Created by 刘鹏 on 2017/10/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SPLanguageCell.h"
#import "SPLanguage.h"

@interface SPLanguageCell ()

@property (nonatomic, strong) UILabel *title_lbl;
@property (nonatomic, strong) UIView *round;

@end

#define round_height 10.0f

@implementation SPLanguageCell

+ (instancetype)languageWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"SPLanguageCell";
    SPLanguageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[SPLanguageCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *title_lbl = [[UILabel alloc] init];
        [self.contentView addSubview:title_lbl];
        self.title_lbl = title_lbl;
        self.title_lbl.font = [UIFont systemFontOfSize:13.0f];
        
        UIView *round = [[UIView alloc] init];
        round.backgroundColor = [UIColor purpleColor];
        round.frame = CGRectMake(0, 0, round_height, round_height);
        round.layer.cornerRadius = round_height * 0.5;
        round.hidden = YES;
        [self.contentView addSubview:round];
        self.round = round;
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSDictionary *dict = @{NSFontAttributeName: self.title_lbl.font};
    CGRect rect = [@"sd" boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil];
    
    CGFloat x = 18;
    CGFloat y = (self.frame.size.height - rect.size.height) * 0.5;
    CGFloat w = 200;
    CGFloat h = 20;
    self.title_lbl.frame = CGRectMake(x, y, w, h);
    
    w = round_height;
    h = w;
    y = (self.frame.size.height - h) * 0.5;
    x = self.frame.size.width - w - 30;
    self.round.frame = CGRectMake(x, y, w, h);
}

- (void)setLanguage:(SPLanguage *)language {
    _language = language;
    self.title_lbl.text = language.title;
    self.round.hidden = !language.is_select;
}

@end
