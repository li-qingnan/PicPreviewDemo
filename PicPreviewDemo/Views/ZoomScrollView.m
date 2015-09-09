//
//  ZoomScrollView.m
//  PicPreviewDemo
//
//  Created by Yinan on 15/9/9.
//  Copyright (c) 2015年 Yinan. All rights reserved.
//

#import "ZoomScrollView.h"

@implementation ZoomScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建imageView
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.image = image;
        [self addSubview:_imageView];
        
        //scrollView进行参数设置
        self.minimumZoomScale = 0.1;
        self.maximumZoomScale = 2.5;
        self.delegate = self;
    }
    return  self;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize boundsSize = self.bounds.size;
    CGRect viewFrame = _imageView.frame;
    
    if (viewFrame.size.width < boundsSize.width)
        viewFrame.origin.x = (((boundsSize.width - viewFrame.size.width) / 2.0f) + self.contentOffset.x);
    else
        viewFrame.origin.x = 0.0f;
    
    if (viewFrame.size.height < boundsSize.height)
        viewFrame.origin.y = (((boundsSize.height - viewFrame.size.height) / 2.0f) + self.contentOffset.y);
    else
        viewFrame.origin.y = 0.0f;
    
    _imageView.frame = viewFrame;
}

@end
