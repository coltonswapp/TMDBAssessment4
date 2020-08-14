//
//  CBSMovieController.m
//  TMDBAssessment4
//
//  Created by Colton Swapp on 8/14/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import "CBSMovieController.h"
#import "CBSMovie.h"

static NSString * const baseURLString = @"https://api.themoviedb.org/3";
static NSString * const baseImageURLString = @"https://image.tmdb.org/t/p/w500";
static NSString * const movieSearchComponentString = @"search/movie";
static NSString * const apiKeyKey = @"api_key";
static NSString * const apiKey = @"e8369f0c787da6ec0da2dd3a8efd0c3c";
static NSString * const queryKey = @"query";

@implementation CBSMovieController

+ (void)fetchMovie:(NSString *)searchTerm completion:(void (^)(NSArray<CBSMovie *> * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSURL * movieSearchURL = [baseURL URLByAppendingPathComponent:movieSearchComponentString];
    
    NSURLComponents * components = [[NSURLComponents alloc]initWithURL:movieSearchURL resolvingAgainstBaseURL:true];
    
    NSMutableArray * queryItems = [NSMutableArray new];
    
    NSURLQueryItem * apiQueryItem = [NSURLQueryItem queryItemWithName:apiKeyKey value:apiKey];
    NSURLQueryItem * searchQueryItem = [NSURLQueryItem queryItemWithName:queryKey value:searchTerm];
    
    [queryItems addObject:apiQueryItem];
    [queryItems addObject:searchQueryItem];
    
    components.queryItems = @[searchQueryItem, apiQueryItem];
    
    
    NSURL * finalURL = [components URL];
    NSLog(@"%@", finalURL);
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:finalURL
                                                            cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                        timeoutInterval:10.0];
    
    [[[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (!data)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        NSDictionary<NSString *, id> * topLevel = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        
        NSMutableArray * moviesArray = [NSMutableArray new];
        for (NSDictionary * resultsDictionary in topLevel[@"results"])
        {
            CBSMovie * movie = [[CBSMovie alloc]initWithDictionary:resultsDictionary];
            [moviesArray addObject:movie];
        }
        completion(moviesArray);
        
    }] resume ];
}

+ (void)fetchPoster:(CBSMovie *)forMovie completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL * imageBaseURL = [NSURL URLWithString:baseImageURLString];
    
    NSURL * finalImageURL = [imageBaseURL URLByAppendingPathComponent:forMovie.imageURL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalImageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (!data)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        UIImage * image = [UIImage imageWithData:data];
        completion(image);
        
    }] resume];
}

@end
