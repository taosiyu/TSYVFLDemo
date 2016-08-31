//
//  CardView.m
//  TSYVFLDemo
//
//  Created by 陈余鹏 on 30/8/16.
//  Copyright © 2016年 taothinkrain. All rights reserved.
//

#import "CardView.h"

@implementation CardView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self defaultStyle];
    }
    return self;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self defaultStyle];
    }
    return self;
}
- (void)awakeFromNib {
    [self defaultStyle];
}

- (void)defaultStyle {
    
    self.userInteractionEnabled = YES;
    
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:10.0f];
    self.layer.shouldRasterize = YES;
    //当shouldRasterize设成true时，layer被渲染成一个bitmap，并缓存起来，等下次使用时不会再重新去渲染了。实现圆角本身就是在做颜色混合（blending），如果每次页面出来时都blending，消耗太大，这时shouldRasterize = yes，下次就只是简单的从渲染引擎的cache里读取那张bitmap，节约系统资源。
    
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    //实现组透明的效果，如果它被设置为YES，在应用透明度之前，图层及其子图层都会被整合成一个整体的图片，这样就没有透明度混合的问题了;为了启用shouldRasterize属性，我们设置了图层的rasterizationScale属性。默认情况下，所有图层拉伸都是1.0， 所以如果你使用了shouldRasterize属性，你就要确保你设置了rasterizationScale属性去匹配屏幕，以防止出现Retina屏幕像素化的问题。
    
    CGFloat scaleBackgroud = 245.0f / 255.0f;
    self.backgroundColor = [UIColor colorWithRed:scaleBackgroud green:scaleBackgroud blue:scaleBackgroud alpha:1];
    
    CGFloat scaleBorder = 176.0f / 255.0f;
    [self.layer setBorderWidth:.45];
    [self.layer setBorderColor:[UIColor colorWithRed:scaleBorder green:scaleBorder blue:scaleBorder alpha:1].CGColor];
}


- (void)cc_layoutSubviews {}













@end
