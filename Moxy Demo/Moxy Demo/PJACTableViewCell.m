//
//  PJACTableViewCell.m
//  Moxy Demo
//
//  Created by Andrew Crites on 4/9/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import "PJACTableViewCell.h"

@implementation PJACTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    self.responseLabel.textColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
