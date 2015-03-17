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
    UIImage *image = [UIImage imageWithData:[self.imageDataArray objectAtIndex:indexPath.row]];
    cell.imageView.image = image;
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageDataArray.count;
}

- (void) getUIImageFromURL: (NSURL *)url withCompletion:(YSImageCollectionViewCell *(^)(UIImage *image))complete
{

    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         if (!connectionError)
         {
             complete([UIImage imageWithData:data]);
         }
     }];
}

@end
