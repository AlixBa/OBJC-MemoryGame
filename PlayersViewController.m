//
//  PlayersViewController.m
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import "PlayersViewController.h"

@interface PlayersViewController ()
@end

@implementation PlayersViewController

@synthesize segmentedControl;
@synthesize labelPlayer3;
@synthesize labelPlayer4;
@synthesize textFieldPlayer1;
@synthesize textFieldPlayer2;
@synthesize textFieldPlayer3;
@synthesize textFieldPlayer4;
@synthesize animatedDistance;

/******************************************
 * UIViewController
 ******************************************/

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/******************************************
 * UITextFieldDelegate
 ******************************************/

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

/******************************************
 * UI events
 ******************************************/

- (IBAction)segmentControlValueChanged:(UISegmentedControl *)sender
{
    if ([sender selectedSegmentIndex] == 0)
    {
        [[self labelPlayer3] setHidden:YES];
        [[self labelPlayer4] setHidden:YES];
        [[self textFieldPlayer3] setHidden:YES];
        [[self textFieldPlayer4] setHidden:YES];
    }
    else
    {
        if ([sender selectedSegmentIndex] == 1)
        {
            [[self labelPlayer3] setHidden:NO];
            [[self labelPlayer4] setHidden:YES];
            [[self textFieldPlayer3] setHidden:NO];
            [[self textFieldPlayer4] setHidden:YES];
        }
        else
        {
            [[self labelPlayer3] setHidden:NO];
            [[self labelPlayer4] setHidden:NO];
            [[self textFieldPlayer3] setHidden:NO];
            [[self textFieldPlayer4] setHidden:NO];
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"playMultiplayer"])
    {
        MultiViewController *v = [segue destinationViewController];
        
        NSMutableArray *a = [[NSMutableArray alloc] init];
        
        if ([[self segmentedControl] selectedSegmentIndex] >= 0)
        {
            [a addObject:[[Player alloc] initWithName:[textFieldPlayer1 text]]];
            [a addObject:[[Player alloc] initWithName:[textFieldPlayer2 text]]];
            
            if ([[self segmentedControl] selectedSegmentIndex] >= 1)
            {
                [a addObject:[[Player alloc] initWithName:[textFieldPlayer3 text]]];
                
                if ([[self segmentedControl] selectedSegmentIndex] >= 2)
                {
                    [a addObject:[[Player alloc] initWithName:[textFieldPlayer4 text]]];
                }
            }
        }
        
        [v setPlayers:a];
    }
}

@end
