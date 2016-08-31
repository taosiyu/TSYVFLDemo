//
//  TSYMainToolView.h
//  TSYVFLDemo
//
//  Created by 陈余鹏 on 30/8/16.
//  Copyright © 2016年 taothinkrain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSYBaseSetting.h"
#import "CardView.h"

@class TSYMainToolView;

@protocol TSYDraggableContainerDelegate <NSObject>

- (void)draggableContainer:(TSYMainToolView *)draggableContainer
        draggableDirection:(TSYDragDirection)draggableDirection
                widthRatio:(CGFloat)widthRatio
               heightRatio:(CGFloat)heightRatio;

- (void)draggableContainer:(TSYMainToolView *)draggableContainer
                  cardView:(CardView *)cardView
            didSelectIndex:(NSInteger)didSelectIndex;

/**
 *@brief 卡片滑完之后
 **/
- (void)draggableContainer:(TSYMainToolView *)draggableContainer
 finishedDraggableLastCard:(BOOL)finishedDraggableLastCard;

@end

@protocol TSYDraggableContainerDataSource <NSObject>

@required
/**
 *@brief通过数据源返回一个新的 cardview
 **/
- (CardView *)draggableContainer:(TSYMainToolView *)draggableContainer
                               viewForIndex:(NSInteger)index;

- (NSInteger)numberOfIndexs;//返回的是数据的总count

@end

@interface TSYMainToolView : UIView

@property (nonatomic) TSYDragStyle     style;
@property (nonatomic) TSYDragDirection direction;

@property(nonatomic,weak)id<TSYDraggableContainerDataSource>dataSource;

@property(nonatomic,weak)id<TSYDraggableContainerDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame style:(TSYDragStyle)style;
- (void)removeFormDirection:(TSYDragDirection)direction;
- (void)reloadData;

@end
