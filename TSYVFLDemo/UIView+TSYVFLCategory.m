//
//  UIView+TSYVFLCategory.m
//  TSYVFLDemo
//
//  Created by 陈余鹏 on 24/8/16.
//  Copyright © 2016年 taothinkrain. All rights reserved.
//

#import "UIView+TSYVFLCategory.h"

@implementation UIView (TSYVFLCategory)

#pragma mark ------->通过传输过来的数据设置约束（下左右高）
-(void)tao_addConstraintsWithViewName:(UIView*)viewName andInfoBottom:(CGFloat)bottom Left:(CGFloat)left Right:(CGFloat)right Height:(CGFloat)height{
    [self tao_addConstraintsWithViewName:viewName andInfoTop:0 Left:left Right:right Bottom:bottom byViewName:nil BysideName:constraintsNoSuper];
     [self tao_constrainView:viewName toWidth:height];
}

#pragma mark ------->通过传输过来的数据设置约束（上左右高）
-(void)tao_addConstraintsWithViewName:(UIView*)viewName andInfoTop:(CGFloat)top Left:(CGFloat)left Right:(CGFloat)right Height:(CGFloat)height{
    [self tao_addConstraintsWithViewName:viewName andInfoTop:top Left:left Right:right Bottom:0 byViewName:nil BysideName:constraintsNoSuper];
    [self tao_constrainView:viewName toWidth:height];
}

#pragma mark ------->为单个控件设置约束属性(下左宽高)
-(void)tao_addConstraintsWithViewName:(UIView*)viewName andInfoTop:(CGFloat)top Left:(CGFloat)left Width:(CGFloat)width Height:(CGFloat)height{
    [self tao_addConstraintsWithViewName:viewName andInfoTop:top Left:left Right:0 Bottom:0 byViewName:nil BysideName:constraintsNone];
    [self tao_constrainView:viewName toHeight:height];
     [self tao_constrainView:viewName toWidth:width];
}


#pragma mark ------->通过传输过来的数据设置约束（正中间）
-(void)tao_addConstraintsWithViewName:(UIView*)viewName withWidth:(CGFloat)width Height:(CGFloat)height{
    
    CGFloat sw = self.frame.size.width;
    CGFloat vw = viewName.frame.size.width;
    
    CGFloat sh = self.frame.size.height;
    CGFloat vh = viewName.frame.size.height;
    
    
    [self tao_addConstraintsWithViewName:viewName andInfoTop:(sh-vh)*0.5 Left:(sw-vw)*0.5 Right:(sw-vw)*0.5 Bottom:(sh-vh)*0.5 byViewName:nil BysideName:constraintsNone];
}

#pragma mark ------->通过传输过来的数据设置约束（上下左右）
-(void)tao_addConstraintsWithViewName:(UIView*)viewName andInfoTop:(CGFloat)top Left:(CGFloat)left Right:(CGFloat)right Bottom:(CGFloat)bottom byViewName:(UIView*)sideViewName BysideName:(ConstraintsPlace)place{
    
    NSString *formatH = [NSString stringWithFormat:@"H:%@-[viewName]-%@",place==constraintsLeft?(left?[NSString stringWithFormat:@"[sideViewName]-%f",left]:@"[sideViewName]"):(left?[NSString stringWithFormat:@"|-%f",left]:(place==constraintsNoSuper?@"":@"|")),place==constraintsRight?(right?[NSString stringWithFormat:@"%f-[sideViewName]",right]:@"[sideViewName]"):(right?[NSString stringWithFormat:@"%f-|",right]:(place==constraintsNoSuper?@"":@"|"))];
    
    NSString *formatV = [NSString stringWithFormat:@"V:%@-[viewName]-%@",place==constraintsTop?(top?[NSString stringWithFormat:@"[sideViewName]-%f",top]:@"[sideViewName]"):(top?[NSString stringWithFormat:@"|-%f",top]:(place==constraintsNoSuper?@"":@"|")),place==constraintsBottom?(bottom?[NSString stringWithFormat:@"%f-[sideViewName]",bottom]:@"[sideViewName]"):(bottom?[NSString stringWithFormat:@"%f-|",bottom]:(place==constraintsNoSuper?@"":@"|"))];
    
    if (sideViewName) {
        NSDictionary *bindings = NSDictionaryOfVariableBindings(viewName,sideViewName);
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:formatH options:0 metrics:nil views:bindings];
        NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:formatV options:0 metrics:nil views:bindings];
        [self addConstraints:constraints];
        [self addConstraints:constraints2];
    }else{
        NSDictionary *bindings = NSDictionaryOfVariableBindings(viewName);
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:formatH options:0 metrics:nil views:bindings];
        NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:formatV options:0 metrics:nil views:bindings];
        [self addConstraints:constraints];
        [self addConstraints:constraints2];
    }
    
}

#pragma mark ------->通过传输过来的数据设置约束（上下左右）基于给定的superview
-(void)tao_addConstraintsWithViewName:(UIView*)viewName andInfoTop:(CGFloat)top Left:(CGFloat)left Right:(CGFloat)right Bottom:(CGFloat)bottom byViewName:(UIView*)sideViewName{
    
    NSString *formatH = [NSString stringWithFormat:@"H:%@-[viewName]-%@",left?([NSString stringWithFormat:@"[sideViewName]-%f",left]):@"[sideViewName]",right?([NSString stringWithFormat:@"%f-[sideViewName]",right]):@"[sideViewName]"];
    
    NSString *formatV = [NSString stringWithFormat:@"V:%@-[viewName]-%@",top?([NSString stringWithFormat:@"[sideViewName]-%f",top]):@"[sideViewName]",bottom?([NSString stringWithFormat:@"%f-[sideViewName]",bottom]):@"[sideViewName]"];
    
    
    NSDictionary *bindings = NSDictionaryOfVariableBindings(viewName,sideViewName);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:formatH options:0 metrics:nil views:bindings];
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:formatV options:0 metrics:nil views:bindings];
    [self addConstraints:constraints];
    [self addConstraints:constraints2];
}

#pragma mark ------->设置translatesAutoresizingMaskIntoConstraints=NO
-(void)tao_addConstraintsWithViews:(NSArray*)views{
    for (UIView *vc in views) {
        [self addSubview:vc];
        vc.translatesAutoresizingMaskIntoConstraints=NO;
    }
}

#pragma mark 给控件设置宽度约束
- (void)tao_constrainView:(UIView *)view toWidth:(CGFloat)width {
    NSString *formatString = @"H:[view(==width)]";
    NSDictionary *bindings = NSDictionaryOfVariableBindings(view);
    NSDictionary *metrics = @{@"width":@(width)};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:formatString options:0 metrics:metrics views:bindings];
    
    [self addConstraints:constraints];
}

#pragma mark 给控件设置高度约束
- (void)tao_constrainView:(UIView *)view toHeight:(CGFloat)height {
    NSString *formatString = @"V:[view(==height)]";
    NSDictionary *bindings = NSDictionaryOfVariableBindings(view);
    NSDictionary *metrics = @{@"height":@(height)};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:formatString options:0 metrics:metrics views:bindings];
    
    [self addConstraints:constraints];
}

#pragma mark 给控件设置左边约束
- (void)tao_constrainView:(UIView *)view toLeft:(CGFloat)left {
    NSString *formatString = @"H:|-left-[view]";
    NSDictionary *bindings = NSDictionaryOfVariableBindings(view);
    NSDictionary *metrics = @{@"left":@(left)};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:formatString options:0 metrics:metrics views:bindings];
    
    [self addConstraints:constraints];
}

#pragma mark 给控件设右边边约束
- (void)tao_constrainView:(UIView *)view toRight:(CGFloat)right {
    NSString *formatString = @"H:[view]-right-|";
    NSDictionary *bindings = NSDictionaryOfVariableBindings(view);
    NSDictionary *metrics = @{@"right":@(right)};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:formatString options:0 metrics:metrics views:bindings];
    
    [self addConstraints:constraints];
}

#pragma mark 给控件设上边边约束--top
- (void)tao_constrainView:(UIView *)view toTop:(CGFloat)top {
    NSString *formatString = @"V:|-top_[view]";
    NSDictionary *bindings = NSDictionaryOfVariableBindings(view);
    NSDictionary *metrics = @{@"top":@(top)};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:formatString options:0 metrics:metrics views:bindings];
    
    [self addConstraints:constraints];
}

#pragma mark 给控件设下边边约束--bottom
- (void)tao_constrainView:(UIView *)view toBottom:(CGFloat)Bottom {
    NSString *formatString = @"V:[view]-Bottom-|";
    NSDictionary *bindings = NSDictionaryOfVariableBindings(view);
    NSDictionary *metrics = @{@"Bottom":@(Bottom)};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:formatString options:0 metrics:metrics views:bindings];
    
    [self addConstraints:constraints];
}







#pragma mark =============================================内部使用

#pragma mark ------->通过传输过来的数据设置约束（上左右）
-(void)tao_addConstraintsWithViewName:(UIView*)viewName andInfoTop:(CGFloat)top Left:(CGFloat)left Right:(CGFloat)right{
    
    [self tao_addConstraintsWithViewName:viewName andInfoTop:top Left:left Right:right Bottom:0 byViewName:nil BysideName:constraintsNone];
}









#pragma mark 给穿过来的view重新命名方便处理
-(void)viewsForDictionaryWithSameName:(NSArray*)views{
    
    NSMutableString *formatString = [NSMutableString string];
    NSMutableString *formatStringTwo = [NSMutableString string];
    NSMutableDictionary *bindings = [NSMutableDictionary dictionary];
    int i = 1;

    [formatString appendString:@"V:|-"];
    for (UIView *view in views)
    {
        NSString *viewName =  [NSString stringWithFormat:@"view%0d", i++];
        
        [formatString appendFormat:@"[%@]%@",viewName, (i <= views.count) ? @"-" : @""];
        
        bindings[viewName] = view;
        
        
        //下面的是给每个view添加单独的左右约束
        
        [formatStringTwo appendFormat:@"H:|-[%@]-|",viewName];
        
        NSArray *constraints = [NSLayoutConstraint  constraintsWithVisualFormat:formatString options:NSLayoutFormatAlignAllCenterY metrics:nil views:bindings];
        
        [self addConstraints:constraints];

        
    }
    NSArray *constraints = [NSLayoutConstraint  constraintsWithVisualFormat:formatString options:NSLayoutFormatAlignAllCenterY metrics:nil views:bindings];
    
    [self addConstraints:constraints];
}

@end
