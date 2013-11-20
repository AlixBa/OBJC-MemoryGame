//
//  MultiViewController.h
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultiPlayerGame.h"
#import "UICard.h"

@interface MultiViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (nonatomic, retain) MultiPlayerGame *game;
@property (nonatomic, retain) NSMutableArray *players;
@property (weak, nonatomic) IBOutlet UILabel *labelPlayer;
@property (nonatomic, retain) NSMutableArray *visibleCards;

@end
