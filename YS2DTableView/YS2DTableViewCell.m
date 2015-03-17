//
//  YS2DTableViewCell.m
//  YS2DTableView
//
//  Created by Yi-Chin Sun on 3/16/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "YS2DTableViewCell.h"
#import "YSImageCollectionViewCell.h"

@implementation YS2DTableViewCell

- (void)awakeFromNib
{
    self.contentArray = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YSImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.contentArray.count;
}

@end
