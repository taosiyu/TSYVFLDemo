//
//  customCardView.m
//  TSYVFLDemo
//
//  Created by 陈余鹏 on 30/8/16.
//  Copyright © 2016年 taothinkrain. All rights reserved.
//

#import "customCardView.h"

@interface customCardView()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel     *titleLabel;

@end

@implementation customCardView

- (instancetype)init {
    if (self = [super init]) {
        [self loadComponent];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadComponent];
    }
    return self;
}

- (void)loadComponent {
    self.imageView = [[UIImageView alloc] init];
    self.titleLabel = [[UILabel alloc] init];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.imageView.layer setMasksToBounds:YES];
    
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    
    self.backgroundColor = [UIColor colorWithRed:0.951 green:0.951 blue:0.951 alpha:1.00];
}

- (void)cc_layoutSubviews {
    
    self.imageView.frame   = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 64);
    self.titleLabel.frame = CGRectMake(0, self.frame.size.height - 64, self.frame.size.width, 64);
}

- (void)installData:(NSDictionary *)element {
    self.imageView.image  = [UIImage imageNamed:element[@"image"]];
    self.titleLabel.text = element[@"title"];
}

@end
