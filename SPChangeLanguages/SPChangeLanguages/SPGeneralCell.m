//
//  SPGeneralCell.m
//  SPChangeLanguages
//
//  Created by 刘鹏 on 2017/10/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SPGeneralCell.h"

@interface SPGeneralCell ()

@property (nonatomic, strong) UILabel *title_lbl;

@end

@implementation SPGeneralCell

+ (instancetype)generalWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"SPGeneralCell";
    SPGeneralCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[SPGeneralCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *title_lbl = [[UILabel alloc] init];
        [self.contentView addSubview:title_lbl];
        self.title_lbl = title_lbl;
        self.title_lbl.font = [UIFont systemFontOfSize:13.0f];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSDictionary *dict = @{NSFontAttributeName: self.title_lbl.font};
    CGRect rect = [@"sd" boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil];
    
    CGFloat y = (self.frame.size.height - rect.size.height) * 0.5;
    self.title_lbl.frame = CGRectMake(18, y, 200, 20);
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    self.title_lbl.text = title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
