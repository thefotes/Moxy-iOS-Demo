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
    NSURL *baseUrl = [NSURL URLWithString:@"http://192.168.1.92:3000"];
    
    NSURL *requestUrl = [NSURL URLWithString:@"" relativeToURL:baseUrl];
    
    NSMutableURLRequest *apiRequest = [NSMutableURLRequest requestWithURL:requestUrl];
    
    apiRequest.HTTPMethod = @"GET";
    
    [NSURLConnection sendAsynchronousRequest:apiRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

                               NSLog(@"%@", json);
                           }];
}
@end
