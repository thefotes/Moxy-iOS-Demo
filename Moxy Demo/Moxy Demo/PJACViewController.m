//
//  PJACViewController.m
//  Moxy Demo
//
//  Created by Peter Foti on 4/9/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import "PJACViewController.h"

@interface PJACViewController ()
- (IBAction)buttonPressed:(UIButton *)sender;
@end

@implementation PJACViewController
- (void)buttonPressed:(UIButton *)sender
{
    NSLog(@"Button: %d", sender.tag);
}
@end
