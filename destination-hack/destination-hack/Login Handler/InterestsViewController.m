//
//  InterestsViewController.m
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "InterestsViewController.h"
#import "SelectionControl.h"

@interface InterestsViewController ()<SelectionControlTapDelegate>{
    NSMutableArray *selectedInterests;
}

@property (weak, nonatomic) IBOutlet UIButton *readyButton;

@end

@implementation InterestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    selectedInterests = [[NSMutableArray alloc] init];
    [_readyButton setHidden:YES];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)readyButtonPressed:(id)sender {
    
}
- (void)viewDidAppear:(BOOL)animated{
    [self setDelegatesForControllers];
}

- (void)setDelegatesForControllers{
    for (NSInteger tag = 401; tag < 407; tag++) {
        SelectionControl *control = (SelectionControl *)[self.view viewWithTag:tag];
        [control setDelegate:self];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)controlVisibilityOfGoButton{
    if ([selectedInterests count] > 0) {
        [_readyButton setHidden:NO];
    }
    else{
        [_readyButton setHidden:YES];
    }
}


- (void)selectedController:(NSString *)text{
    [selectedInterests addObject:text];
    [self controlVisibilityOfGoButton];
}

- (void)deselectedController:(NSString *)text{
    [selectedInterests removeObject:text];
    [self controlVisibilityOfGoButton];
}

@end