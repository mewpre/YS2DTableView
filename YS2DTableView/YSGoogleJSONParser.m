//
//  YSGoogleJSONParser.m
//  YS2DTableView
//
//  Created by Yi-Chin Sun on 3/17/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "YSGoogleJSONParser.h"

@implementation YSGoogleJSONParser

+ (void)getImagesDataWithString:(NSString *)searchString withCompletion:(void(^)(NSDictionary* imageDictionary))complete
{
    NSString *queryString = [NSString stringWithFormat:@"https://www.googleapis.com/customsearch/v1?q=%@&cx=012799440939059275365%%3A94l7uujllrk&fileType=png&searchType=image&key=AIzaSyDVNDs6ii_QG-7_ae7lP285pAgz06_2krw", searchString];
    NSURL * url = [NSURL URLWithString:queryString];

    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         if (!connectionError)
         {
             NSDictionary *JSONData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

             NSArray *imagesData = JSONData[@"items"];
             NSMutableArray *tempArray = [NSMutableArray new];
             for (NSDictionary *imageData in imagesData)
             {
                 NSURL *url = [NSURL URLWithString:imageData[@"link"]];
                 NSURLRequest * request = [NSURLRequest requestWithURL:url];
                 [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
                  {
                      if (!connectionError)
                      {
                          [tempArray addObject:data];

                          if (imagesData.count == tempArray.count)
                          {
                              NSDictionary *imageDictionary = @{@"title": searchString,
                                                                @"imageData": tempArray};
                              complete (imageDictionary);
                          }
                      }
                  }];
             }
         }
     }];
}

@end