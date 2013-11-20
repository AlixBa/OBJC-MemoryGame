//
//  Player.m
//  Memory2
//
//  Created by Litz on 05/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize name;
@synthesize points;
@synthesize peersInARow;

- (id) initWithName:(NSString *)_name
{
    if (!(self = [super init]))
        return nil;
    
    [self setName:_name];
    [self setPoints:[NSNumber numberWithDouble:0.0]];
    [self setPeersInARow:[NSNumber numberWithInt:0]];
    
    return self;
}

- (void)saveScoreTo:(NSString *)mode
{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *f = [docDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", mode]];
    NSMutableDictionary *d = [NSMutableDictionary dictionaryWithContentsOfFile:f];
    
    if ([mode isEqualToString:@"single"])
    {
        NSNumber *pts = [d objectForKey:[self name]];
        
        if (pts != nil)
        {
            if ([[self points] doubleValue] < [pts doubleValue])
            {
                [d removeObjectForKey:[self name]];
                [d setObject:[self points] forKey:[self name]];
            }
        }
        else
        {
            [d setObject:[self points] forKey:[self name]];
        }
    }
    else
    {
        NSNumber *pts = [d objectForKey:[self name]];
        
        if (pts != nil)
        {
            if ([[self points] doubleValue] > [pts doubleValue])
            {
                [d removeObjectForKey:[self name]];
                [d setObject:[self points] forKey:[self name]];
            }
        }
        else
        {
            [d setObject:[self points] forKey:[self name]];
        }
    }
    
    [d writeToFile:f atomically:YES];
}

@end
