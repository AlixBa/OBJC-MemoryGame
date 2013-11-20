//
//  Game.h
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Player.h"

@interface Game : NSObject

@property (nonatomic, retain) NSMutableArray *cards;
@property (nonatomic, retain) NSMutableArray *visibleCards;

- (id)init;
- (void)turnCard:(Card *)card;
- (BOOL)compareCard:(Card *)card;
- (BOOL)isGameFinished;

@end
