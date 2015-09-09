//
//  PreviewImageView.m
//  PicPreviewDemo
//
//  Created by Yinan on 15/9/9.
//  Copyright (c) 2015年 Yinan. All rights reserved.
//

#import "PreviewImageView.h"

@implementation PreviewImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image
{
    self =  [super initWithFrame:frame];
    if (self) {
        
        //创建一个UIImageView
        UIImageView *imageview=[[UIImageView alloc]initWithImage:image];
        imageview.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        imageview.userInteractionEnabled=YES;
        [self addSubview:imageview];
    }
  
    return self;
}


//使用responder 的这个方式 实现点击UIImageView响应
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //实现代理方法
    [_delegete imageViewDelegate:self];
    [_targer performSelector:_action withObject:self];
}

@end
