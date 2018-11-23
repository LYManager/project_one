//
//  LYMineView.m
//  DrawView
//
//  Created by 赵良育 on 2017/12/15.
//  Copyright © 2017年 赵良育. All rights reserved.
//

#import "LYMineView.h"
#define Font42              [UIScreen mainScreen].bounds.size.height < 735.5 ? [UIFont fontWithName:@"Heiti SC" size:10] : [UIFont fontWithName:@"Heiti SC" size:11]
#define CenterOffsetY (self.frame.size.width/5)    // 向上偏移量
static NSInteger BaseBtnTag = 5000;
@interface LYMineView()
/** 🐶headImageView    👇*/
@property(nonatomic,strong)UIImageView * imageView;

/** 🐶我的收藏    👇*/
@property(nonatomic,strong)UIButton * myCollectBtn;
/** 🐶我的课程    👇*/
@property(nonatomic,strong)UIButton * myCourseBtn;
/** 🐶我的咨询    👇*/
@property(nonatomic,strong)UIButton * myConsultBtn;
/** 🐶我的关注    👇*/
@property(nonatomic,strong)UIButton * myCareBtn;

/** 🐶工具    👇*/
@property(nonatomic,strong)UIButton * toolsBtn;
/** 🐶手册    👇*/
@property(nonatomic,strong)UIButton * handbookBtn;
/** 🐶论坛    👇*/
@property(nonatomic,strong)UIButton * formBtn;
/** 🐶今日运势    👇*/
@property(nonatomic,strong)UIButton * todayLuckBtn;
/** 🐶咨询管理    👇*/
@property(nonatomic,strong)UIButton * consultManagerBtn;

@end


@implementation LYMineView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self configUIWithFrame:frame];
        self.backgroundColor = LYRGBColor(9, 9, 9);
    }
    return self;
}

- (void)loadHeaderImageWithImageURL:(NSString *)imageURL
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:Head_PlaceHolder]];
}

- (void)changeConsultManagerTitle
{
    [self.consultManagerBtn setTitle:@"咨询管理" forState:UIControlStateNormal];
}

- ( void) configUIWithFrame:(CGRect)frame
{
    CGPoint center = CGPointMake(frame.size.width/2, frame.size.height/2 - CenterOffsetY);
    // 间距
    CGFloat orgin = (frame.size.width - 20) / 10;
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, orgin * 2, orgin * 2)];
    self.imageView.center = center;
    self.imageView.layer.cornerRadius = orgin;
    self.imageView.layer.borderWidth = 5;
    self.imageView.layer.borderColor = LYRGBColor(139, 124, 103).CGColor;
    self.imageView.clipsToBounds = YES;
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userHeaderImageViewTapAction)];
//    [self.imageView addGestureRecognizer:tap];
//    self.imageView.userInteractionEnabled = YES;
    [self addSubview:self.imageView];
 
    UIButton * myCourseBtn = [self p_getBtnWithBtnWidth:orgin + 20 width:3*orgin angle:180];
    [myCourseBtn setTitle:@"八字排盘" forState:UIControlStateNormal];
    myCourseBtn.tag = BaseBtnTag + 6;
    [self addSubview:myCourseBtn];

    UIButton * myCollectBtn = [self p_getBtnWithBtnWidth:orgin + 20  width:4*orgin angle:125];
    [myCollectBtn setTitle:@"六壬起课" forState:UIControlStateNormal];
    myCollectBtn.tag = BaseBtnTag + 8;
    [self addSubview:myCollectBtn];

    UIButton * handbookBtn = [self p_getBtnWithBtnWidth:orgin  width:5*orgin angle:75];
    [handbookBtn setTitle:@"塔罗" forState:UIControlStateNormal];
    handbookBtn.tag = BaseBtnTag + 3;
    [self addSubview:handbookBtn];

    UIButton * myCareBtn = [self p_getBtnWithBtnWidth:orgin + 20 width:4*orgin angle:45];
    [myCareBtn setTitle:@"六爻起卦" forState:UIControlStateNormal];
    myCareBtn.tag = BaseBtnTag + 7;
    [self addSubview:myCareBtn];

    UIButton * consultManagerBtn = [self p_getBtnWithBtnWidth:orgin+20 width:4*orgin angle:315];
    [consultManagerBtn setTitle:@"奇门遁甲" forState:UIControlStateNormal];
    self.consultManagerBtn = consultManagerBtn;
    consultManagerBtn.tag = BaseBtnTag + 4;
    [self addSubview:consultManagerBtn];

    UIButton * toolsBtn = [self p_getBtnWithBtnWidth:orgin width:5*orgin angle:225];
    [toolsBtn setTitle:@"解梦" forState:UIControlStateNormal];
    toolsBtn.tag = BaseBtnTag + 2;
    [self addSubview:toolsBtn];

    UIButton * myConsultBtn = [self p_getBtnWithBtnWidth:orgin + 20 width:4*orgin angle:250];
    [myConsultBtn setTitle:@"紫薇斗数" forState:UIControlStateNormal];
    myConsultBtn.tag = BaseBtnTag + 5;
    [self addSubview:myConsultBtn];

    UIButton * todayLuckBtn = [self p_getBtnWithBtnWidth:orgin + 20 width:3*orgin angle:0];
    [todayLuckBtn setTitle:@"悬空飞星" forState:UIControlStateNormal];
    todayLuckBtn.tag = BaseBtnTag + 1;
    [self addSubview:todayLuckBtn];

//    UIButton * formBtn = [self p_getBtnWithBtnWidth:orgin width:5*orgin angle:150];
//    [formBtn setTitle:@"论坛" forState:UIControlStateNormal];
//    [self addSubview:formBtn];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(frame)-100, frame.size.width, 100)];
    imageView.contentMode =  UIViewContentModeScaleAspectFill;
    imageView.image = [UIImage imageNamed:@"mine_bottom_bg"];
    [self addSubview:imageView];

//    UIImageView * bbsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMinY(imageView.frame) - 100, 100, 120)];
//    bbsImageView.image = [UIImage imageNamed:@"bbs_imge_icon"];
//    UITapGestureRecognizer * bbsTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bbsImageViewTapAction)];
//    [bbsImageView addGestureRecognizer:bbsTap];
//    bbsImageView.userInteractionEnabled = YES;
//    [self addSubview:bbsImageView];
}

- (UIButton *)p_getBtnWithBtnWidth:(CGFloat)btnWidth width:(CGFloat)width angle:(CGFloat)angle
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, btnWidth, btnWidth);
    button.center = [self p_getViewCenterWithWidth:width angle:angle frame:self.frame];
    [button setBackgroundImage:[UIImage imageNamed:@"mine_btn_bg_icon"] forState:UIControlStateNormal];
    button.titleLabel.font = Font42;
    [button addTarget:self action:@selector(itemDidSelectedAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void) itemDidSelectedAction:(UIButton *)sender
{
    NSInteger index = sender.tag - BaseBtnTag;
    if ([self.delegate respondsToSelector:@selector(didSelectedItemWithIndex:)]) {
        [self.delegate didSelectedItemWithIndex:index-1];
    }
}

- (void)userHeaderImageViewTapAction
{
    if ([self.delegate respondsToSelector:@selector(didSelectedItemWithIndex:)]) {
        [self.delegate didSelectedItemWithIndex:9];
    }
}

- (void) bbsImageViewTapAction
{
    if ([self.delegate respondsToSelector:@selector(didSelectedItemWithIndex:)]) {
        [self.delegate didSelectedItemWithIndex:10];
    }
}
/**
 获取控件的center

 @param width 距离中心点的距离
 @param angle 角度
 @return 控件的center
 */
- (CGPoint) p_getViewCenterWithWidth:(CGFloat)width angle:(CGFloat)angle frame:(CGRect)frame
{
    CGPoint pointSelf = CGPointMake(frame.size.width/2, frame.size.height/2 - CenterOffsetY);
    CGFloat centerX = pointSelf.x + cos(M_PI /180 * angle) * width;
    CGFloat centerY = pointSelf.y - sin(M_PI / 180 * angle) * width;
    return CGPointMake(centerX, centerY);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2 - CenterOffsetY);
    // 间距
    CGFloat orgin = (rect.size.width - 20) / 10;
     CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 70/255.0, 63/255.0, 52/255.0, 1);
    CGContextSetLineWidth(context, 1);
     CGFloat arr[] = {3,3};
    CGContextSetLineDash(context, 0, arr, 2);
    CGContextAddArc(context, center.x, center.y, orgin*2, 0, 2*M_PI, 0);
    CGContextDrawPath(context, kCGPathStroke);


    CGContextRef contextTwo = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(contextTwo, 70/255.0, 63/255.0, 52/255.0, 0.8);
    CGContextSetLineWidth(contextTwo, 1);
    CGFloat arrTwo[] = {3,3};
    CGContextSetLineDash(contextTwo, 0, arrTwo, 2);
    CGContextAddArc(contextTwo, center.x, center.y, orgin*3, 0, 2*M_PI, 0);
    CGContextDrawPath(contextTwo, kCGPathStroke);

    CGContextRef contextThree = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(contextThree, 70/255.0, 63/255.0, 52/255.0, 0.7);
    CGContextSetLineWidth(contextThree, 1);
    CGFloat arrThree[] = {3,3};
    CGContextSetLineDash(contextThree, 0, arrThree, 2);
    CGContextAddArc(contextThree, center.x, center.y, orgin*4, 0, 2*M_PI, 0);
    CGContextDrawPath(contextThree, kCGPathStroke);

    CGContextRef contextFour = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(contextFour, 70/255.0, 63/255.0, 52/255.0, 0.6);
    CGContextSetLineWidth(contextFour, 1);
    CGFloat arrFour[] = {3,3};
    CGContextSetLineDash(contextFour, 0, arrFour, 2);
    CGContextAddArc(contextFour, center.x, center.y, orgin*5, 0, 2*M_PI, 0);
    CGContextDrawPath(contextFour, kCGPathStroke);
}


@end
