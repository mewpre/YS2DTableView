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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated]; 

    // Configure the view for the selected state
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YSImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSInteger dataSourceIndex;

    // Since pulling from Google Image Search only yields 10 images, if we want to show more, just repeat previous images
    if (indexPath.row < self.imageDataArray.count)
    {
        dataSourceIndex = indexPath.row;
    }
    else
    {
        dataSourceIndex = indexPath.row % self.imageDataArray.count;
    }

    UIImage *image = [UIImage imageWithData:[self.imageDataArray objectAtIndex:dataSourceIndex]];
    cell.imageView.image = image;
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // can set to any number > 0.
    return 15;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YSImageCollectionViewCell *cell = (YSImageCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];

    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[cell.imageView.image] applicationActivities:@[]];
    activityVC.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypePrint];

    UITableView *tv = (UITableView *) self.superview.superview;
    UIViewController *vc = (UITableViewController *) tv.dataSource;

    [vc presentViewController:activityVC animated:TRUE completion:nil];
}

-(CGSize)collectionView:(UICollectionView *)collectionView
                 layout:(UICollectionViewLayout*)collectionViewLayout
 sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.rowHeight - 1, self.rowHeight - 1);
}


@end
