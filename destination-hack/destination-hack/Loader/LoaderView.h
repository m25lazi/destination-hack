//
//  LoaderView.h
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LoaderView : NSObject
+ (void)showLoaderViewFor:(UIViewController *)vc;
+ (void)hideLoaderViewFrom:(UIViewController *)vc;
+ (void)showFatalErrorFor:(UIViewController *)vc text:(NSString *)text;
@end
