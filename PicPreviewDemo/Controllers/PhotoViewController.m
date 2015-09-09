//
//  PhotoViewController.m
//  PicPreviewDemo
//
//  Created by Yinan on 15/9/9.
//  Copyright (c) 2015年 Yinan. All rights reserved.
//

#import "PhotoViewController.h"
#import "ZoomScrollView.h"

@interface PhotoViewController ()<UIScrollViewDelegate>

{
    UIScrollView *_bottomScrollView;
    UIPageControl *_pageControl;
    
}

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=[NSString stringWithFormat:@"第%ld张",_number-100+1];
    [self initialScrollView];
}

- (void)initialScrollView
{

    _bottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_bottomScrollView];
    _bottomScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 12, 0);
    _bottomScrollView.pagingEnabled = YES;
    _bottomScrollView.delegate = self;
    
    //创建图片
    for (int i = 0; i < 12; i++) {
        //给定图片frame x为底层ScrollView的宽度 * 相应的i  h应为底层ScrollView的高度 - 64 因为上面有导航栏和状态栏
        CGRect frame = CGRectMake(_bottomScrollView.frame.size.width * i, 0, _bottomScrollView.frame.size.width, _bottomScrollView.frame.size.height - 64);
        NSString *name = [NSString stringWithFormat:@"%d.gif",i +1];
        UIImage *image = [UIImage imageNamed:name];
        
        //创建相应的scrollView
        ZoomScrollView *scrollView = [[ZoomScrollView alloc] initWithFrame:frame image:image];
        scrollView.tag = 100 +i;
        [_bottomScrollView addSubview:scrollView];

        
    }
    
    
    //显示指定图片
    //偏移量
    CGFloat x = (_number - 100) * 320;
    CGPoint offset = CGPointMake(x, 0);
    [_bottomScrollView setContentOffset:offset animated:YES];
    //显示在photoViewController上
    [self.view addSubview:_bottomScrollView];
    
    //创建UIPageControl
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(100, 500, 120, 50)];
    //设置page个数
    _pageControl.numberOfPages = 12;
    _pageControl.currentPageIndicatorTintColor=[UIColor greenColor];
    _pageControl.pageIndicatorTintColor=[UIColor grayColor];
    [self.view addSubview:_pageControl];

    //添加响应方法
    [_pageControl addTarget:self action:@selector(handlePageControlAction:) forControlEvents:UIControlEventValueChanged];
    
    //显示制定page小点  page从0开始
    CGFloat a = _number - 100 ;
    _pageControl.currentPage = a;
}

//滑动方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{   //偏移量
    CGFloat x = scrollView.contentOffset.x/320;
    //设置相应的title x的值第一页为0  所以加1
    self.navigationItem.title=[NSString stringWithFormat:@"第%d张",(int)x+1];
    //page当前页 从0开始
    _pageControl.currentPage = x;
    
    
    //四个 scrollView 都有可能触发这个代理方法执行
    if (_bottomScrollView == scrollView) {//滑动证明了_bottomScrollView
        //滑动大的scrollView停止
        NSInteger currentPage = scrollView.contentOffset.x / _bottomScrollView.frame.size.width;
        //获取左侧,右侧的scrollView
        
        ZoomScrollView *leftScorllView = (ZoomScrollView *)[_bottomScrollView viewWithTag:100 + currentPage - 1];
        ZoomScrollView *rightScrollView = (ZoomScrollView *)[_bottomScrollView viewWithTag:100 + currentPage + 1];
        
        [leftScorllView setZoomScale:1.0];
        [rightScrollView setZoomScale:1.0];
    }
    else{
        //滑动小的scrollView停止
        
        return ;
        
    }
}


- (void)handlePageControlAction:(UIPageControl *)pagecontrol
{
    CGPoint offset=CGPointMake(pagecontrol.currentPage * _bottomScrollView.frame.size.width, 0) ;
    [_bottomScrollView setContentOffset:offset animated:YES];
    self.navigationItem.title = [NSString stringWithFormat:@"第%d张",(int)_pageControl.currentPage+1];
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
