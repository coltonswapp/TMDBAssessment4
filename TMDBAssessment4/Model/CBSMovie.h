//
//  CBSMovie.h
//  TMDBAssessment4
//
//  Created by Colton Swapp on 8/14/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBSImageURL.h"

NS_ASSUME_NONNULL_BEGIN

@interface CBSMovie : NSObject

@property (nonatomic, copy, readonly)NSString * title;
@property (nonatomic, readonly)NSInteger rating;
@property (nonatomic, copy, readonly)NSString * overview;
@property (nonatomic, readonly)NSString * imageURL;

- (instancetype)initWithTitle:(NSString *)title
                       rating:(NSInteger)rating
                     overview:(NSString *)overview
                     imageURL:(NSString * _Nullable)image;


@end

@interface CBSMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
