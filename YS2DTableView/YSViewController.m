//
//  YSViewController.m
//  YS2DTableView
//
//  Created by Yi-Chin Sun on 3/14/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "YSViewController.h"
#import "YS2DTableViewCell.h"
#import "YSGoogleJSONParser.h"

@interface YSViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *categoriesArray;
@property NSArray *searchTermsArray;
@property UIActivityIndicatorView *activityIndicator;

@end

@implementation YSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupActivityIndicator];
    [self.activityIndicator startAnimating];

    self.searchTermsArray = @[@"piano", @"karaoke", @"guitar", @"ocarina", @"microphone", @"music", @"notes"];
    self.categoriesArray = [NSMutableArray new];
    for (NSString *searchTerm in self.searchTermsArray)
    {
        [YSGoogleJSONParser getImagesDataWithString:searchTerm withCompletion:^(NSDictionary* imageDictionary) {
            [self.categoriesArray addObject:imageDictionary];
            [self.tableView reloadData];

            if (self.categoriesArray.count == self.searchTermsArray.count)
            {
                [self.activityIndicator stopAnimating];
            }
        }];
    }
}

- (void)setupActivityIndicator {
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityIndicator.color = [[self view]tintColor];
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    self.activityIndicator.hidesWhenStopped = YES;
}

- (YS2DTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YS2DTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.rowHeight = [self setTableViewHeight];
    cell.imageDataArray = [self.categoriesArray objectAtIndex:indexPath.section][@"imageData"];
    [cell.innerCollectionView reloadData];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.categoriesArray.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.categoriesArray objectAtIndex: section][@"title"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self setTableViewHeight];
}

- (CGFloat) setTableViewHeight
{
    return 120;
}

@end
