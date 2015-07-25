//
//  AddReviewVC.m
//  destination-hack
//
//  Created by Jubin Benny on 26/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "AddReviewVC.h"

@interface AddReviewVC ()
@property (weak, nonatomic) IBOutlet UIView *ratingView;
@property (weak, nonatomic) IBOutlet UITextView *reviewTextArea;

@end

@implementation AddReviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _ratingView.frame;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor], (id)[[UIColor greenColor] CGColor], nil];
    gradient.startPoint = CGPointMake(50, 77);
    gradient.endPoint = CGPointMake(350, 77);
    [_ratingView.layer insertSublayer:gradient atIndex:0];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
