//
//  TSYBaseSetting.h
//  TSYVFLDemo
//
//  Created by 陈余鹏 on 30/8/16.
//  Copyright © 2016年 taothinkrain. All rights reserved.
//

#ifndef TSYBaseSetting_h
#define TSYBaseSetting_h

#define TTWidth  [UIScreen mainScreen].bounds.size.width
#define TTHeight [UIScreen mainScreen].bounds.size.height

typedef NS_OPTIONS(NSInteger, TSYDragDirection) {
    TSYDragDirectionDefault     = 0,
    TSYDragDirectionLeft        = 1 << 0,
    TSYDragDirectionRight       = 1 << 1
};

typedef NS_OPTIONS(NSInteger, TSYDragStyle) {
    TSYDragStyleUpOverlay   = 0,
    TSYDragStyleDownOverlay = 1
};

static const CGFloat kBoundaryRatio = 0.5f;

static const CGFloat kFirstCardScale  = 1.08f;
static const CGFloat kSecondCardScale = 1.04f;

static const CGFloat kCardEdage = 10.0f;
static const CGFloat kContainerEdage = 30.0f;
static const CGFloat kNavigationHeight = 64.0f;
static const CGFloat kVisibleCount = 3;

#endif /* TSYBaseSetting_h */
