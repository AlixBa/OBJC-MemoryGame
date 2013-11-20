//
//  SinglePlayerGame.h
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import "Game.h"

@interface SinglePlayerGame : Game

@property (nonatomic, retain) NSDate *start;
@property (nonatomic) NSTimeInterval duration;

- (void)turnCard:(Card *)card;
- (BOOL)compareCard:(Card *)card;
- (NSTimeInterval)playingTime;

@end
