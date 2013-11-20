//
//  UIHighscore.m
//  Memory2
//
//  Created by Litz on 05/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import "UIHighscore.h"

@implementation UIHighscore

@synthesize labelPlayer;
@synthesize labelPoints;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
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
