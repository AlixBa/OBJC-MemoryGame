//
//  HighscoresViewController.h
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIHighscore.h"

@interface HighscoresViewController : UIViewController <UITabBarControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSMutableDictionary *singleD;
@property (nonatomic, retain) NSMutableDictionary *multiD;
@property (nonatomic, retain) NSArray *single;
@property (nonatomic, retain) NSArray *multi;

@end
