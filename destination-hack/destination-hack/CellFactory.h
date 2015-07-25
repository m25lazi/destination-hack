//
//  CellFactory.h
//  destination-hack
//
//  Created by Jubin Benny on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *const FLCellFactoryMainActionIdentifier;
extern NSString *const FLCellFactoryFeedsIdentifier;
extern NSString *const FLCellFactoryImageListIdentifier;
extern NSString *const FLCellFactoryScrollingzImageIdentifier;


@interface CellFactory : NSObject

+ (UITableViewCell *)populateObject:(id)object atIndexpath:(NSIndexPath *)indexPath inView:(UICollectionView *)collectionView withIdentifier:(NSString *)identifer;
@end
