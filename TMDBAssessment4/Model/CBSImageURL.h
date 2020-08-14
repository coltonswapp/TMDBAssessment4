//
//  CBSImageURL.h
//  TMDBAssessment4
//
//  Created by Colton Swapp on 8/14/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBSImageURL : NSObject

@property (nonatomic, copy, readonly)NSString * imageURL;

- (instancetype)initWithImage:(NSString *)image;

@end

@interface CBSImageURL (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
