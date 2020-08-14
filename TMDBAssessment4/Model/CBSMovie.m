//
//  CBSMovie.m
//  TMDBAssessment4
//
//  Created by Colton Swapp on 8/14/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import "CBSMovie.h"
@class CBSImageURL;

static NSString * const titleKey = @"title";
static NSString * const ratingKey = @"vote_average";
static NSString * const overviewKey = @"overview";
static NSString * const imageKey = @"poster_path";

@implementation CBSMovie

- (instancetype)initWithTitle:(NSString *)title rating:(NSInteger)rating overview:(NSString *)overview imageURL:(NSString * _Nullable)image
{
    self = [super init];
    if (self)
    {
        _title = title;
        _rating = rating;
        _overview = overview;
        _imageURL = image;
        
    }
    return self;
}

@end

@implementation CBSMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * title = dictionary[titleKey];
    NSInteger rating = [dictionary[ratingKey]intValue];
    NSString * overview = dictionary[overviewKey];
    NSString * image = dictionary[imageKey];
    
    return [self initWithTitle:title rating:rating overview:overview imageURL:image];
}

@end
