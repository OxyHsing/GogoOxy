//
//  DataLogicController.h
//  GogoOxy
//
//  Created by oxy.hsing on 2013/12/18.
//  Copyright (c) 2013年 oxyDevGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GOMovieInfo.h"

typedef void(^FinishBlock)();

#define JSON_KEY_MOVIES @"movies"
#define JSON_TITLE @"title"
#define JSON_RATING @"rating"
#define JSON_YEAR @"year"
#define JSON_POSTER @"poster"
#define JSON_POSTER_URLS @"urls"
#define JSON_POSTER_W92 @"w92"
#define JSON_POSTER_W154 @"w154"
#define JSON_POSTER_W185 @"w185"
#define JSON_POSTER_ORIGINAL @"original"
#define UpdateUINotification @"UPDATE_UI_NOTIFICATION"

@interface DataLogicController : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>{

    NSMutableArray * resultArray;
    FinishBlock _finishBlock;
}
//Query result
@property (nonatomic, readonly) NSMutableArray * resultArray;


+(DataLogicController *)sharedInstance;

-(void)fetchDataFromInternet:(FinishBlock)finishBlock;

@end