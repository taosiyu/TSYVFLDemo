//
//  ViewController.m
//  TSYVFLDemo
//
//  Created by 陈余鹏 on 23/8/16.
//  Copyright © 2016年 taothinkrain. All rights reserved.
//

#import "ViewController.h"
#import "UIView+TSYVFLCategory.h"
#import "TSYMainToolView.h"
#import "customCardView.h"

@interface ViewController ()<TSYDraggableContainerDelegate,TSYDraggableContainerDataSource>

@property(nonatomic,strong)UIView *view1;

@property(nonatomic,strong)UIView *view2;

@property(nonatomic,strong)UIView *view3;

@property (nonatomic, strong) TSYMainToolView *container;
@property (nonatomic, strong) NSMutableArray *dataSources;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _view1 = [[UIView alloc]init];
    _view1.backgroundColor = [UIColor whiteColor];
    _view1.translatesAutoresizingMaskIntoConstraints=NO;
    
    _view2 = [[UIView alloc]init];
    _view2.backgroundColor = [UIColor greenColor];
    _view2.translatesAutoresizingMaskIntoConstraints=NO;
    
    _view3 = [[UIView alloc]init];
    _view3.backgroundColor = [UIColor blueColor];
    _view3.translatesAutoresizingMaskIntoConstraints=NO;
    
    UIView *view4 = [[UIView alloc]init];
    view4.backgroundColor = [UIColor purpleColor];
    view4.translatesAutoresizingMaskIntoConstraints=NO;
    
    [self.view addSubview:_view1];
    [self.view addSubview:_view2];
    [self.view addSubview:_view3];
    [self.view addSubview:view4];
    self.view.backgroundColor = [UIColor grayColor];
    
    UIView *view1 = _view1;
    UIView *view2 = _view2;
    UIView *view3 = _view3;
    
    NSDictionary *bindings = NSDictionaryOfVariableBindings(view1,view2);
    NSArray *constraints=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[view1]-30-[view2(==view1)]-20-|" options:0 metrics:nil views:bindings];
    NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[view1(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1)];
    NSArray *constraints3=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[view2(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view2)];
    [self.view addConstraints:constraints];
    [self.view addConstraints:constraints2];
    [self.view addConstraints:constraints3];
    
    [self.view tao_addConstraintsWithViewName:view3 andInfoTop:50 Left:30 Right:20 Bottom:0 byViewName:view1 BysideName:constraintsTop];
    [self.view tao_constrainView:view3 toHeight:20];
    
    [self.view tao_addConstraintsWithViewName:view4 andInfoTop:100 Left:10 Right:10 Bottom:10 byViewName:nil BysideName:constraintsNoSuper];
    [self.view tao_constrainView:view4 toHeight:50];

    [self loadData];
    [self loadUI];
}

- (void)loadData {
    
    _dataSources = [NSMutableArray array];
    
    for (int i = 0; i < 9; i++) {
        NSDictionary *dict = @{@"image" : [NSString stringWithFormat:@"image_%d.jpg",i + 1],
                               @"title" : [NSString stringWithFormat:@"Page %d",i + 1]};
        [_dataSources addObject:dict];
    }
}

- (void)loadUI {
    
    self.container = [[TSYMainToolView alloc] initWithFrame:CGRectMake(0, 64, TTWidth, TTWidth) style:TSYDragStyleDownOverlay];
    self.container.delegate = self;
    self.container.dataSource = self;
    [self.view addSubview:self.container];
    
    [self.container reloadData];
}

- (CardView *)draggableContainer:(TSYMainToolView *)draggableContainer viewForIndex:(NSInteger)index {
    
    customCardView *cardView = [[customCardView alloc] initWithFrame:draggableContainer.bounds];
    [cardView installData:[_dataSources objectAtIndex:index]];
    return cardView;
}

- (NSInteger)numberOfIndexs {
    return _dataSources.count;
}

- (void)draggableContainer:(TSYMainToolView *)draggableContainer draggableDirection:(TSYDragDirection)draggableDirection widthRatio:(CGFloat)widthRatio heightRatio:(CGFloat)heightRatio {
    
    CGFloat scale = 1 + ((kBoundaryRatio > fabs(widthRatio) ? fabs(widthRatio) : kBoundaryRatio)) / 4;
    NSLog(@"比例=======   %f",scale);
    if (draggableDirection == TSYDragDirectionLeft) {
        _view1.transform = CGAffineTransformMakeScale(scale, scale);
    }
    if (draggableDirection == TSYDragDirectionRight) {
        _view2.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
}



- (void)constrainView:(UIView *)view toWidth:(CGFloat)width {
    NSString *formatString = @"V:[view(==width)]";
    NSDictionary *bindings = NSDictionaryOfVariableBindings(view);
    NSDictionary *metrics = @{@"width":@(width)};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:formatString options:0 metrics:metrics views:bindings];
    
    [self.view addConstraints:constraints];
}

- (void)draggableContainer:(TSYMainToolView *)draggableContainer cardView:(CardView *)cardView didSelectIndex:(NSInteger)didSelectIndex{
    
    NSLog(@"点击了Tag为%ld的Card", (long)didSelectIndex);
    
}

- (void)draggableContainer:(TSYMainToolView *)draggableContainer finishedDraggableLastCard:(BOOL)finishedDraggableLastCard {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [draggableContainer reloadData];
        
    });
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}














@end
