//
//  SingleViewController.h
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinglePlayerGame.h"
#import "UICard.h"

@interface SingleViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (nonatomic, retain) SinglePlayerGame *game;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) NSMutableArray *visibleCards;

@end
