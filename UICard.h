//
//  UICard.h
//  Memory2
//
//  Created by Litz on 04/03/13.
//  Copyright (c) 2013 BB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICard : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;

- (id)initWithFrame:(CGRect)frame;

@end
