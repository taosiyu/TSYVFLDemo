//
//  CardView.h
//  TSYVFLDemo
//
//  Created by 陈余鹏 on 30/8/16.
//  Copyright © 2016年 taothinkrain. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *@brief 这是现实的卡片view可以自定义
 */
@interface CardView : UIView

@property (nonatomic) CGAffineTransform originalTransform;//原始的位置，方便回位

- (void)cc_layoutSubviews;

@end
