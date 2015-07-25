//
//  MainPage.m
//  destination-hack
//
//  Created by Jubin Benny on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "MainPage.h"
#import "CellFactory.h"

@interface MainPage ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation MainPage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.collectionView registerNib:[UINib nibWithNibName:@"PopularImageView" bundle:nil] forCellWithReuseIdentifier:FLCellFactoryImageListIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MajorActionViews" bundle:nil] forCellWithReuseIdentifier:FLCellFactoryMainActionIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FeedsView" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:FLCellFactoryFeedsIdentifier];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    } else {
        return 5;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell = (UICollectionViewCell *)[CellFactory populateObject:nil atIndexpath:indexPath inView:collectionView withIdentifier:FLCellFactoryImageListIdentifier];
        } else {
            cell = (UICollectionViewCell *)[CellFactory populateObject:nil atIndexpath:indexPath inView:collectionView withIdentifier:FLCellFactoryMainActionIdentifier];
        }
    } else {
        cell = (UICollectionViewCell *)[CellFactory populateObject:nil atIndexpath:indexPath inView:collectionView withIdentifier:FLCellFactoryFeedsIdentifier];
    }
    return cell;
}

#pragma mark - UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row ==0) {
            return CGSizeMake(400, 200);
        } else {
            return CGSizeMake(400., 70);
        }
    } else {
        return CGSizeMake(400, 340);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
