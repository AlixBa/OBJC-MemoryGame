//
//  Player.h
//  Memory2
//
//  Created by Litz on 05/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic) NSNumber *points;
@property (nonatomic) NSNumber *peersInARow;

- (id)initWithName:(NSString *)_name;
- (void)saveScoreTo:(NSString *)mode;

@end
