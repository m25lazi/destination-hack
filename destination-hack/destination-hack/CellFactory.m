//
//  CellFactory.m
//  destination-hack
//
//  Created by Jubin Benny on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "CellFactory.h"

NSString *const FLCellFactoryMainActionIdentifier = @"FLCellFactoryMainActionIdentifier";
NSString *const FLCellFactoryFeedsIdentifier = @"FLCellFactoryFeedsIdentifier";
NSString *const FLCellFactoryImageListIdentifier = @"FLCellFactoryImageListIdentifier";
NSString *const FLCellFactoryScrollingzImageIdentifier = @"FLCellFactoryScrollingzImageIdentifier";

@implementation CellFactory

+ (UITableViewCell *)populateObject:(id)object atIndexpath:(NSIndexPath *)indexPath inView:(UICollectionView *)collectionView withIdentifier:(NSString *)identifer {
    id cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];
    return cell;
}
@end
