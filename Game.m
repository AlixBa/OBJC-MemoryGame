//
//  Game.m
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import "Game.h"

@implementation Game

@synthesize cards;
@synthesize visibleCards;

- (id)init
{
    if (!(self = [super init]))
        return nil;
    
    [self setVisibleCards:[[NSMutableArray alloc] init]];
    [self setCards:[[NSMutableArray alloc] initWithCapacity:32]];
    NSMutableArray *a = [[NSMutableArray alloc] initWithCapacity:32];
    
    for (NSInteger i = 0; i < 2; i++)
        for (NSString *v in [Card possibleLabels])
            for (UIColor *c in [Card possibleColors])
                [a addObject:[[Card alloc] initWithLabel:v andColor:c]];
    
    while ([a count])
    {
        NSInteger r = arc4random() % [a count];
        [[self cards] addObject:[a objectAtIndex:r]];
        [a removeObjectAtIndex:r];
    }
    
    return self;
}

- (void)turnCard:(Card *)card
{
    [card setState:STATE_VISIBLE];
    [[self visibleCards] addObject:card];
}

- (BOOL)compareCard:(Card *)card
{
    Card *matchingC;
    
    if ([[self visibleCards] count] > 1)
    {
        for (Card *c in [self visibleCards])
        {
            if (!([card isEqual:c]) && !(matchingC))
            {
                matchingC = c;
                
                if ([[card label] isEqualToString:[matchingC label]] && [[card color] isEqual:[matchingC color]])
                {
                    [card setState:STATE_FOUND];
                    [matchingC setState:STATE_FOUND];
                }
                else
                {
                    [card setState:STATE_HIDDEN];
                    [matchingC setState:STATE_HIDDEN];
                }
            }
        }
        
        if (matchingC)
        {
            [[self visibleCards] removeObject:matchingC];
            [[self visibleCards] removeObject:card];
        }
    }
    
    return (matchingC == nil);
}

- (BOOL)isGameFinished
{
    for (Card *c in [self cards])
    {
        if ([c isCardHidden])
            return NO;
    }
    
    return YES;
}

@end
