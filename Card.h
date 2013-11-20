//
//  Card.h
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

extern NSString * const STATE_FOUND;
extern NSString * const STATE_VISIBLE;
extern NSString * const STATE_HIDDEN;

@property (nonatomic) NSString *label;
@property (nonatomic, retain) UIColor *color;
@property (nonatomic, retain) NSString *state;
	
- (id)initWithLabel:(NSString *)_label andColor:(UIColor *)_color;
- (BOOL) isCardFound;
- (BOOL) isCardVisible;
- (BOOL) isCardHidden;
+ (NSArray *) possibleLabels;
+ (NSArray *) possibleColors;

@end
