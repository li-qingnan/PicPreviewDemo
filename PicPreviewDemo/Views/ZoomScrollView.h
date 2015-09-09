//
//  ZoomScrollView.h
//  PicPreviewDemo
//
//  Created by Yinan on 15/9/9.
//  Copyright (c) 2015年 Yinan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZoomScrollView : UIScrollView<UIScrollViewDelegate>

@property(nonatomic,retain,readonly) UIImageView *imageView;
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image;

@end
