//
//  PJACTableViewCell.h
//  Moxy Demo
//
//  Created by Andrew Crites on 4/9/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PJACTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *responseLabel;
@property (nonatomic) BOOL hasTransformed;
@end
