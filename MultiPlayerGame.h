//
//  MultiPlayerGame.h
//  Memory2
//
//  Created by Litz on 06/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import "Game.h"

@interface MultiPlayerGame : Game

@property (nonatomic, retain) NSMutableArray *players;
@property (nonatomic) NSNumber *indexPlayingPlayer;

- (id)initWithPlayers:(NSMutableArray *)p;
- (BOOL)compareCard:(Card *)card;

@end
