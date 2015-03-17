//
//  YSGoogleJSONParser.h
//  YS2DTableView
//
//  Created by Yi-Chin Sun on 3/17/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSGoogleJSONParser : NSObject

+ (void)getImagesDataWithString:(NSString *)searchString withCompletion:(void(^)(NSDictionary* imageDictionary))complete;

@end
