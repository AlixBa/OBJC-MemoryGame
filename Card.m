//
//  Card.m
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import "Card.h"

@implementation Card

NSString * const STATE_FOUND = @"FOUND";
NSString * const STATE_VISIBLE = @"VISIBLE";
NSString * const STATE_HIDDEN = @"HIDDEN";

@synthesize label;
@synthesize color;
@synthesize state;

- (id) initWithLabel:(NSString *)_label andColor:(UIColor *)_color
{
    if (!(self = [super init]))
        return nil;
    
    [self setLabel:_label];
    [self setColor:_color];
    [self setState:STATE_HIDDEN];
    
    return self;
}

- (BOOL) isCardFound
{
    if ([self state] == STATE_FOUND)
        return YES;
    return NO;
}

- (BOOL) isCardVisible
{
    if ([self state] == STATE_VISIBLE)
        return YES;
    return NO;
}

- (BOOL) isCardHidden
{
    if ([self state] == STATE_HIDDEN)
        return YES;
    return NO;
}

+ (NSArray *) possibleLabels
{
    return [NSArray arrayWithObjects:
            @"⚀",
            @"⚁",
            @"⚂",
            @"⚃",
            nil];
}

+ (NSArray *) possibleColors
{
    return [NSArray arrayWithObjects:
            [UIColor redColor],
            [UIColor blueColor],
            [UIColor yellowColor],
            [UIColor greenColor],
            nil];
}

@end
