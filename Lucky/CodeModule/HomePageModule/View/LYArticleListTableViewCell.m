// LYArticleListTableViewCell.m 
// Lucky 
// 
// Created by 赵良育 on 2018/11/22. 
// Copyright © 2018 赵良育. All rights reserved. 
// 

#import "LYArticleListTableViewCell.h"

NSString * const kArticleListCellIdentifier = @"LYArticleListTableViewCell";

@implementation LYArticleListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configUI];
    }
    return self;
}

- (void) configUI
{
    _articleImageView = ({
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        imageView;
    });
    [self.contentView addSubview:_articleImageView];
    
    _articleTitleLabel = ({
        UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = LYRGBColor(60, 60, 60);
        titleLabel;
    });
    [self.contentView addSubview:_articleTitleLabel];
    
    _articleDesLabel = ({
        UILabel * desLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        desLabel.numberOfLines = 0;
        desLabel;
    });
    [self.contentView addSubview:_articleDesLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak typeof(self)weakSelf = self;
    [_articleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kMargin);
        make.left.mas_equalTo(kMargin);
        make.bottom.mas_equalTo(-kMargin);
        make.width.mas_equalTo(weakSelf.articleImageView.mas_height).multipliedBy(1.5);
    }];
    
    [_articleTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kMargin);
        make.left.equalTo(weakSelf.articleImageView.mas_right).offset(kMargin);
        make.right.mas_equalTo(-kMargin);
        make.height.mas_equalTo(20);
    }];
    
    [_articleDesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.articleTitleLabel.mas_left);
        make.right.mas_equalTo(weakSelf.articleTitleLabel.mas_right);
        make.top.equalTo(weakSelf.articleTitleLabel.mas_bottom).offset(kMargin);
        make.bottom.mas_equalTo(-kMargin);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
