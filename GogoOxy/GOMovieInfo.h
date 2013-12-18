//
//  GOMovieInfo.h
//  GogoOxy
//
//  Created by oxy.hsing on 2013/12/18.
//  Copyright (c) 2013年 oxyDevGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GOMovieInfo : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * rating;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, strong) NSString * imageURL;

@end
