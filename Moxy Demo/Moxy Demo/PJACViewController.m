//
//  PJACViewController.m
//  Moxy Demo
//
//  Created by Peter Foti on 4/9/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import "PJACViewController.h"

@interface PJACViewController () <UITableViewDataSource,UITableViewDelegate>
- (IBAction)buttonPressed:(UIButton *)sender;
@property (strong, nonatomic) NSMutableArray *responses;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation PJACViewController

- (NSMutableArray *)responses
{
    if (!_responses) {
        _responses = [NSMutableArray new];
    }
    
    return _responses;
}
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
                               
                               [self.responses addObject:json];
                               
                               [self.tableView reloadData];

                           }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [self.responses objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.responses.count;
}
@end
