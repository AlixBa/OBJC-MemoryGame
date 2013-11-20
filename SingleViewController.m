//
//  SingleViewController.m
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import "SingleViewController.h"

@interface SingleViewController ()
@end

@implementation SingleViewController

@synthesize collection;
@synthesize game;
@synthesize timer;
@synthesize visibleCards;

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
    [self setGame:[[SinglePlayerGame alloc] init]];
    [self setVisibleCards:[[NSMutableArray alloc] init]];
    
    if ([self interfaceOrientation] == UIInterfaceOrientationLandscapeLeft || [self interfaceOrientation] == UIInterfaceOrientationLandscapeRight)
    {
        UICollectionViewFlowLayout *cvfl =[[UICollectionViewFlowLayout alloc] init];
        [cvfl setMinimumLineSpacing:13];
        [cvfl setMinimumInteritemSpacing:17];
        [cvfl setItemSize:CGSizeMake(40, 40)];
        [[self collection] setCollectionViewLayout:cvfl];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        UICollectionViewFlowLayout *cvfl =[[UICollectionViewFlowLayout alloc] init];
        [cvfl setMinimumLineSpacing:13];
        [cvfl setMinimumInteritemSpacing:17];
        [cvfl setItemSize:CGSizeMake(40, 40)];
        [[self collection] setCollectionViewLayout:cvfl];
    }
    else
    {
        UICollectionViewFlowLayout *cvfl =[[UICollectionViewFlowLayout alloc] init];
        [cvfl setMinimumLineSpacing:4];
        [cvfl setMinimumInteritemSpacing:40];
        [cvfl setItemSize:CGSizeMake(40, 40)];
        [[self collection] setCollectionViewLayout:cvfl];
    }
}

/******************************************
 * UICollectionViewDataSource
 ******************************************/

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 32;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICard *c = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICard" forIndexPath:indexPath];
    Card *c2 = [[[self game] cards] objectAtIndex:[indexPath item]];
    
    if ([c2 isCardHidden])
    {
        [[c label] setText:@"✻"];
        [[c label] setTextColor:[UIColor whiteColor]];
        //[[c label] setText:[c2 label]];
        //[[c label] setTextColor:[c2 color]];
        
        if ([[self visibleCards] indexOfObject:indexPath] != NSNotFound)
        {
            [[self visibleCards] removeObject:indexPath];
        }
    }
    else
    {
        if ([c2 isCardVisible])
        {
            [[c label] setText:[c2 label]];
            [[c label] setTextColor:[c2 color]];
        }
        else
        {
            if ([c2 isCardFound])
            {
                [[c label] setText:[c2 label]];
                [[c label] setTextColor:[c2 color]];
                [[c label] setAlpha:0.3];
                
                if ([[self visibleCards] indexOfObject:indexPath] != NSNotFound)
                {
                    [[self visibleCards] removeObject:indexPath];
                }
            }
        }
    }
    
    return c;
}

/******************************************
 * UICollectionViewDelegateFlowLayout
 ******************************************/

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (!([self timer]))
    {
        [self setTimer:[NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(refreshTimeLabel) userInfo:nil repeats:YES]];
    }
    
    Card *c = [[[self game] cards] objectAtIndex:[indexPath item]];
    
    if ([c isCardHidden])
    {
        [[self visibleCards] addObject:indexPath];
        
        [[self game] turnCard:c];
        [[self collection] performSelectorOnMainThread:@selector(reloadItemsAtIndexPaths:) withObject:[self visibleCards] waitUntilDone:YES];
        
        if (!([[self game] compareCard:c]))
        {
            [[self collection] performSelector:@selector(reloadItemsAtIndexPaths:) withObject:[self visibleCards] afterDelay:1.0];
        }
    }
    
    if ([[self game] isGameFinished])
    {
        [[self timer] invalidate];
        
        UIAlertView *a = [[UIAlertView alloc]
                          initWithTitle:@"Pseudonyme ?"
                          message:@"Renseignez un pseudonyme"
                          delegate:self
                          cancelButtonTitle:@"Valider"
                          otherButtonTitles:nil, nil];
        [a setAlertViewStyle:UIAlertViewStylePlainTextInput];
        
        UITextField *p = [a textFieldAtIndex:0];
        [p setKeyboardType:UIKeyboardTypeDefault];
        [p setPlaceholder:@"Pseudonyme"];
        
        [a show];
    }
}

/******************************************
 * UIAlertViewDelegate
 ******************************************/

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSNumber *points = [f numberFromString:[NSString stringWithFormat:@"%f", [[self game] duration]]];

    Player *p = [[Player alloc] initWithName:[[alertView textFieldAtIndex:0] text]];
    [p setPoints:points];
    [p saveScoreTo:@"single"];
}

/******************************************
 *
 ******************************************/

- (void)refreshTimeLabel
{
    [[self labelTime] setText:[NSString stringWithFormat:@"Temps : %3.1f", [[self game] playingTime]]];
}

@end
