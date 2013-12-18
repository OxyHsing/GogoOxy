//
//  GOMovieCell.h
//  GogoOxy
//
//  Created by oxy.hsing on 2013/12/18.
//  Copyright (c) 2013年 oxyDevGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GOMovieCell : UITableViewCell{
    IBOutlet UIImageView * imgViewPoster;
    IBOutlet UILabel * lbRating;
    IBOutlet UILabel * lbYear;
    IBOutlet UILabel * lbTitle;
}
@property (nonatomic, strong) UIImageView * imgViewPoster;
@property (nonatomic, strong) UILabel * lbRating;
@property (nonatomic, strong) UILabel * lbYear;
@property (nonatomic, strong) UILabel * lbTitle;

@end
