//
//  SelectionControl.h
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol SelectionControlTapDelegate <NSObject>

@optional
- (void)selectedController:(NSString *)text;
- (void)deselectedController:(NSString *)text;

@end

@interface SelectionControl : UILabel

@property BOOL isSelected;
@property (weak, nonatomic) id<SelectionControlTapDelegate> delegate;

@end
