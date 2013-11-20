//
//  MultiPlayerGame.m
//  Memory2
//
//  Created by Litz on 06/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import "MultiPlayerGame.h"

@implementation MultiPlayerGame

@synthesize players;
@synthesize indexPlayingPlayer;

- (id)initWithPlayers:(NSMutableArray *)p
{
    if (!(self = [super init]))
        return nil;
    
    [self setPlayers:p];
    [self setIndexPlayingPlayer:[NSNumber numberWithInt:0]];
    return self;
}

- (BOOL)compareCard:(Card *)card
{
    BOOL b = [super compareCard:card];
    Player *p = [[self players] objectAtIndex:[[self indexPlayingPlayer] intValue]];
    
    if (!(b))
    {
        if ([card isCardHidden])
        {
            [p setPeersInARow:[NSNumber numberWithInt:0]];
            
            if ([indexPlayingPlayer intValue] == ([[self players] count] - 1))
            {
                [self setIndexPlayingPlayer:[NSNumber numberWithInt:0]];
            }
            else
            {
                [self setIndexPlayingPlayer:[NSNumber numberWithInt:([[self indexPlayingPlayer] intValue] + 1)]];
            }
        }
        else
        {
            if ([card isCardFound])
            {
                [p setPeersInARow:[NSNumber numberWithInt:([[p peersInARow] intValue] + 1)]];
                
                [p setPoints:[NSNumber numberWithInt:([[p points] intValue] + ([[p peersInARow] intValue] * ([[p peersInARow] intValue] + 1)) / 2)]];
            }
        }
    }
    
    return b;
}

@end
