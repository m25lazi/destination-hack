//
//  LoaderView.m
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "LoaderView.h"

#define kLoaderHeight   30.0
#define kLoaderViewTag  111

@implementation LoaderView

+ (void)showLoaderViewFor:(UIViewController *)vc{
    [LoaderView showBottomViewFor:vc text:@"Loading"];
}

+ (void)hideLoaderViewFrom:(UIViewController *)vc{
    UIView *loaderView = [vc.view viewWithTag:kLoaderViewTag];
    if(loaderView){
        [vc.view setUserInteractionEnabled:YES];
        [loaderView removeFromSuperview];
    }
}

+ (void)showFatalErrorFor:(UIViewController *)vc text:(NSString *)text{
    [LoaderView showBottomViewFor:vc text:text];
}

+ (void)showBottomViewFor:(UIViewController *)vc text:(NSString *)text{
    CGRect frame = vc.view.frame;
    UIView *loaderView = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - kLoaderHeight, frame.size.width, kLoaderHeight)];
    
    frame = loaderView.frame;
    frame.origin = CGPointZero;
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setText:text];
    [label setTextColor:[UIColor whiteColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [loaderView addSubview:label];
    
    [loaderView setTag:kLoaderViewTag];
    [loaderView setBackgroundColor:[UIColor blackColor]];
    [vc.view addSubview:loaderView];
    [vc.view setUserInteractionEnabled:NO];
}

@end
