//
//  UIView+TSYVFLCategory.h
//  TSYVFLDemo
//
//  Created by 陈余鹏 on 24/8/16.
//  Copyright © 2016年 taothinkrain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    constraintsTop,
    constraintsLeft,
    constraintsBottom,
    constraintsRight,
    constraintsNone,
    constraintsNoSuper//去除一边或者多变于superview的约束就是@"|"不需要(V:[view])内部使用
}ConstraintsPlace;//设置基准(有一边的约束需要与subviews有关时使用，只有和superview的约束时选择constraintsNone)

@interface UIView (TSYVFLCategory)

/**
 *@brief 添加view和约束与Autosizing控制:translatesAutoresizingMaskIntoConstraints=NO(禁止AutoresizingMask转换成AutoLayout)
 **/
-(void)tao_addConstraintsWithViews:(NSArray*)views;

/**
 *@brief 为单个控件设置约束属性(上左右高)
 **/
-(void)tao_addConstraintsWithViewName:(UIView*)viewName andInfoTop:(CGFloat)top Left:(CGFloat)left Right:(CGFloat)right Height:(CGFloat)height;

/**
 *@brief 为单个控件设置约束属性(下左右高)
 **/
-(void)tao_addConstraintsWithViewName:(UIView*)viewName andInfoBottom:(CGFloat)bottom Left:(CGFloat)left Right:(CGFloat)right Height:(CGFloat)height;

/**
 *@brief 为单个控件设置约束属性(下左宽高)
 **/
-(void)tao_addConstraintsWithViewName:(UIView*)viewName andInfoTop:(CGFloat)top Left:(CGFloat)left Width:(CGFloat)width Height:(CGFloat)height;

/**
 *@brief 为单个控件设置约束属性(正中间)
 **/
-(void)tao_addConstraintsWithViewName:(UIView*)viewName withWidth:(CGFloat)width Height:(CGFloat)height;

/**
 *@brief 为单个控件设置约束属性（上下左右）基于给定的view
 **/
-(void)tao_addConstraintsWithViewName:(UIView*)viewName andInfoTop:(CGFloat)top Left:(CGFloat)left Right:(CGFloat)right Bottom:(CGFloat)bottom byViewName:(UIView*)sideViewName;

/**
 *@brief 为单个控件设置约束属性(上下左右，基准是subview)
 *@param sideViewName 依附的那个view就是参考点
 **/
-(void)tao_addConstraintsWithViewName:(UIView*)viewName andInfoTop:(CGFloat)top Left:(CGFloat)left Right:(CGFloat)right Bottom:(CGFloat)bottom byViewName:(UIView*)sideViewName BysideName:(ConstraintsPlace)place;


#pragma mark 单一的约束，组合使用，单独没有效果-------<<<<<<<<<<<<<<<<<<<<
/**
 *@brief 高的约束
 **/
- (void)tao_constrainView:(UIView *)view toHeight:(CGFloat)height;

/**
 *@brief 宽的约束
 **/
- (void)tao_constrainView:(UIView *)view toWidth:(CGFloat)width;

/**
 *@brief 上边的约束
 **/
- (void)tao_constrainView:(UIView *)view toTop:(CGFloat)top;

/**
 *@brief 下边的约束
 **/
- (void)tao_constrainView:(UIView *)view toBottom:(CGFloat)bottom;

/**
 *@brief 左边的约束
 **/
- (void)tao_constrainView:(UIView *)view toLeft:(CGFloat)left;

/**
 *@brief 右边的约束
 **/
- (void)tao_constrainView:(UIView *)view toRight:(CGFloat)right;
#pragma mark--------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

@end
