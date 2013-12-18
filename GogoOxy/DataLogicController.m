//
//  DataLogicController.m
//  GogoOxy
//
//  Created by oxy.hsing on 2013/12/18.
//  Copyright (c) 2013年 oxyDevGroup. All rights reserved.
//

#import "DataLogicController.h"

@implementation DataLogicController


@synthesize resultArray;

static DataLogicController *_instanse = nil;

+ (DataLogicController *)sharedInstance{
    if(!_instanse){
        _instanse = [[DataLogicController alloc] init];
    }
        return _instanse;
}
- (id)init
{
    self = [super init];
    if(self){
        resultArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)fetchDataFromInternet:(FinishBlock)finishBlock{
    //Fetch From Internet
    _finishBlock = finishBlock;
    NSString * urlString = @"http://api.movies.io/movies/search?q=hobbit";
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    //Check Response
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSUInteger statusCode = [httpResponse statusCode];
    NSLog(@"Fetch URL Response = %lu",(unsigned long)statusCode);

}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    //Start parsing
    NSError *error = NULL;
    NSDictionary * resultDictionary =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"Print ResultDictionary %@",resultDictionary);
    //Object in Movies is a movie array
    [self parsingRawData:[resultDictionary objectForKey:JSON_KEY_MOVIES]];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if(_finishBlock){
        _finishBlock();
    }
    
}


-(void)parsingRawData:(NSArray *)movieArray{
    if(movieArray){
        for(NSDictionary * movie in movieArray){
            GOMovieInfo * movieInfo = [[GOMovieInfo alloc] init];
            movieInfo.title = [movie objectForKey:JSON_TITLE];
            movieInfo.rating = [movie objectForKey:JSON_RATING];
            //Note that year is number value
            movieInfo.year = [[movie objectForKey:JSON_YEAR] integerValue];
            NSDictionary * posterURLsDic = [[movie objectForKey:JSON_POSTER] objectForKey:JSON_POSTER_URLS];
            if([posterURLsDic objectForKey:JSON_POSTER_W185]){
                movieInfo.imageURL = [posterURLsDic objectForKey:JSON_POSTER_W185];
            }
            else if([posterURLsDic objectForKey:JSON_POSTER_W154]){
                movieInfo.imageURL = [posterURLsDic objectForKey:JSON_POSTER_W154];
            }
            else{
                movieInfo.imageURL = [posterURLsDic objectForKey:JSON_POSTER_ORIGINAL];
            }
            //Add into result array
            [resultArray addObject:movieInfo];
        }
        //Finish Parsing, update UI
        [[NSNotificationCenter defaultCenter] postNotificationName:UpdateUINotification object:resultArray];
    }
    else{
        NSLog(@"Parsing Error");
    }
    
}

    
@end
