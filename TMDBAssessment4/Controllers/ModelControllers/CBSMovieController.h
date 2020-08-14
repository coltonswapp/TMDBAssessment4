//
//  CBSMovieController.h
//  TMDBAssessment4
//
//  Created by Colton Swapp on 8/14/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBSMovie.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBSMovieController : NSObject

+ (void)fetchMovie:(NSString *)searchTerm completion:(void (^)(NSArray<CBSMovie *> *))completion;

+ (void)fetchPoster:(CBSMovie *)forMovie completion:(void (^)(UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
