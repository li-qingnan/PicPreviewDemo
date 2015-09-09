//
//  ThumbnailViewController.m
//  PicPreviewDemo
//
//  Created by Yinan on 15/9/9.
//  Copyright (c) 2015年 Yinan. All rights reserved.
//

#import "ThumbnailViewController.h"
#import "PhotoViewController.h"
#import "PreviewImageView.h"

@interface ThumbnailViewController ()

@end

@implementation ThumbnailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"相册";
    
    [self initialThumbnail];
}

- (void)initialThumbnail
{
    CGFloat x = 15,y = 7;

    CGFloat xSpacing = 0;
    CGFloat ySpacing = 0;
    if([UIScreen mainScreen].bounds.size.width == 320){
        xSpacing = 100;
        ySpacing = 130;
    }
    
    if([UIScreen mainScreen].bounds.size.width == 375){
        xSpacing = 127;
        ySpacing = 150;
    }
    
    if([UIScreen mainScreen].bounds.size.width == 414){
        xSpacing = 142;
        ySpacing = 150;
    }
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height+7);
    scrollView.scrollEnabled = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    [self.view addSubview:scrollView];
    
    //显示缩略图
    for (int i = 0; i < 12; i++) {
        
        //创建imageView
        NSString *imageName = [NSString stringWithFormat:@"%d.png",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        PreviewImageView *imageView = [[PreviewImageView alloc] initWithFrame:CGRectMake(x, y, 90, 120)];
        imageView.image = image;
        [scrollView addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        
        //分别给缩略图标记tag
        imageView.tag = 100+i;
        //设置代理
        imageView.targer = self;
        imageView.action = @selector(cutView:);
        
        //布局缩略图
        x += xSpacing;
        if (x >= 300) {
            x = 15;
            y += ySpacing;
            
        }
        
    }

}

- (void)cutView:(UIImageView *)imageView
{
    NSInteger tag = imageView.tag;
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    photoVC.number = tag;
    [self.navigationController pushViewController:photoVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
