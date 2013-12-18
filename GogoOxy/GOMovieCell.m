//
//  GOMovieCell.m
//  GogoOxy
//
//  Created by oxy.hsing on 2013/12/18.
//  Copyright (c) 2013年 oxyDevGroup. All rights reserved.
//

#import "GOMovieCell.h"

@implementation GOMovieCell
@synthesize lbRating, lbTitle, lbYear, imgViewPoster;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
