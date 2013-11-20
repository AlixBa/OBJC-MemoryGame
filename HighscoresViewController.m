//
//  HighscoresViewController.m
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import "HighscoresViewController.h"

@interface HighscoresViewController ()

@end

@implementation HighscoresViewController

@synthesize singleD;
@synthesize multiD;
@synthesize single;
@synthesize multi;

/******************************************
 * UIViewController
 ******************************************/

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[self tabBarController] setDelegate:self];
    
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *f;
    
    if ([[[self tabBarItem] title] isEqualToString:@"Single Player"])
    {
        f = [docDir stringByAppendingPathComponent:@"single.plist"];
        [self setSingleD:[NSMutableDictionary dictionaryWithContentsOfFile:f]];
        [self setSingle:[[self singleD] keysSortedByValueUsingSelector:@selector(compare:)]];
    }
    else
    {
        f = [docDir stringByAppendingPathComponent:@"multi.plist"];
        [self setMultiD:[NSMutableDictionary dictionaryWithContentsOfFile:f]];
        [self setMulti:[[self multiD] keysSortedByValueUsingComparator:^(id first, id second)
                        {
                            if ([first integerValue] > [second integerValue])
                                return (NSComparisonResult)NSOrderedAscending;
                            
                            if ([first integerValue] < [second integerValue])
                                return (NSComparisonResult)NSOrderedDescending;
                            return (NSComparisonResult)NSOrderedSame;
                        }
                        ]
         ];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/******************************************
 * UITableViewDataSource
 ******************************************/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([[[self tabBarItem] title] isEqualToString:@"Single Player"])
    {
        return [[self single] count];
    }
    else
    {
        return [[self multi] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIHighscore *c;
    
    if ([[[self tabBarItem] title] isEqualToString:@"Single Player"])
    {
        c = [tableView dequeueReusableCellWithIdentifier:@"single" forIndexPath:indexPath];
        [[c labelPlayer] setText:[[self single] objectAtIndex:[indexPath item]]];
        [[c labelPoints] setText:[NSString stringWithFormat:@"%3.1f", [[[self singleD] valueForKey:[[self single] objectAtIndex:[indexPath item]]] doubleValue]]];
        
    }
    else
    {
        c = [tableView dequeueReusableCellWithIdentifier:@"multi" forIndexPath:indexPath];
        [[c labelPlayer] setText:[[self multi] objectAtIndex:[indexPath item]]];
        [[c labelPoints] setText:[NSString stringWithFormat:@"%@", [[self multiD] valueForKey:[[self multi] objectAtIndex:[indexPath item]]]]];
    }
    
    return c;
}

/******************************************
 * UITableViewDelegate
 ******************************************/

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}

@end
