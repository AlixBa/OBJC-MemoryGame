//
//  SinglePlayerGame.m
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import "SinglePlayerGame.h"

@implementation SinglePlayerGame

- (void)turnCard:(Card *)card
{
    [super turnCard:card];
    
    if ([self start] == nil)
        [self setStart:[NSDate date]];
}

- (BOOL)compareCard:(Card *)card
{
    BOOL b = [super compareCard:card];
    
    if ([self isGameFinished])
        [self setDuration:[self playingTime]];        
        
    return b;
}

- (NSTimeInterval)playingTime
{
    return [[NSDate date] timeIntervalSinceDate:[self start]];
}

@end
