//
//  CBSImageURL.m
//  TMDBAssessment4
//
//  Created by Colton Swapp on 8/14/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import "CBSImageURL.h"

static NSString * const imageURLKey = @"poster_path";

@implementation CBSImageURL

- (instancetype)initWithImage:(NSString *)image
{
    self = [super init];
    if (self)
    {
        _imageURL = image;
    }
    return self;
}

@end

@implementation CBSImageURL (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * image = dictionary[imageURLKey];
    
    return [self initWithImage:image];
}

@end
