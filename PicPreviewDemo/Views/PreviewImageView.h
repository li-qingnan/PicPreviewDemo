//
//  PreviewImageView.h
//  PicPreviewDemo
//
//  Created by Yinan on 15/9/9.
//  Copyright (c) 2015年 Yinan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PreviewImageViewDelegate <NSObject>

- (void)imageViewDelegate:(UIImageView *)imageView;

@end

@interface PreviewImageView : UIImageView

@property(nonatomic,retain) id<PreviewImageViewDelegate> delegete;

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image;

@property (nonatomic,assign) id targer;
@property (nonatomic,assign) SEL action;

@end
