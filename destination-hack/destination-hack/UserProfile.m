//
//  UserProfile.m
//  destination-hack
//
//  Created by Jubin Benny on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "UserProfile.h"
#import "CellFactory.h"
#import "CellFactory.h"

@interface UserProfile ()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *userSegments;
@property (weak, nonatomic) IBOutlet UIProgressView *userRating;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (strong, nonatomic) IBOutlet UIView *userName;
@property (weak, nonatomic) IBOutlet UILabel *userTitle;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation UserProfile

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_userRating setTransform:CGAffineTransformMakeScale(1.0f, 2.0f)];
    
    _userImage.layer.cornerRadius = 50;
    [_userRating.layer setCornerRadius:3];
    
    _userImage.clipsToBounds = YES;
    [_userRating setClipsToBounds:YES];
    
    [_userName sizeToFit];
    [_userTitle sizeToFit];
    
    [_userSegments addTarget:self
                      action:@selector(segmentedControlChanged)
            forControlEvents:UIControlEventValueChanged];
}

- (void)segmentedControlChanged {
    [_collectionView reloadData];
}

#pragma mark - UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [[UICollectionViewCell alloc] init];
    return cell;
}

#pragma mark - UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
