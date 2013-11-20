//
//  PlayersViewController.h
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultiViewController.h"

@interface PlayersViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *labelPlayer3;
@property (weak, nonatomic) IBOutlet UILabel *labelPlayer4;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPlayer1;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPlayer2;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPlayer3;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPlayer4;
@property (nonatomic) CGFloat animatedDistance;

@end
