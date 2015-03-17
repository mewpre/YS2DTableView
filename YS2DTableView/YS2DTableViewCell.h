//
//  YS2DTableViewCell.h
//  YS2DTableView
//
//  Created by Yi-Chin Sun on 3/16/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YS2DTableViewCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *innerCollectionView;

@property NSArray *contentArray;

@end
