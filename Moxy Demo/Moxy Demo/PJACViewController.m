//
//  PJACViewController.m
//  Moxy Demo
//
//  Created by Peter Foti on 4/9/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import "PJACViewController.h"
#import "PJACTableViewCell.h"
#import "PJACResponseObject.h"

@interface PJACViewController () <UITableViewDataSource,UITableViewDelegate>
- (IBAction)buttonPressed:(UIButton *)sender;
@property (strong, nonatomic) NSMutableArray *responses;
- (IBAction)clearOutTheData:(id)sender;
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

- (IBAction)clearOutTheData:(id)sender
{
    [self.tableView.visibleCells enumerateObjectsUsingBlock:^(PJACTableViewCell *cell, NSUInteger idx, BOOL *stop) {
        
        cell.hasTransformed = NO;
        [UIView animateWithDuration:.7f
                         animations:^{
                             cell.alpha = 0.0f;
                         } completion:^(BOOL finished) {
                             if (finished) {
                                 if (idx == self.responses.count - 1) {
                                     NSLog(@"Runnin");
                                     [self.responses removeAllObjects];
                                     [self.tableView reloadData];
                                 }
                             }
                         }];

    }];

}

- (void)viewDidLoad
{
    [super viewDidLoad];

}
- (void)buttonPressed:(UIButton *)sender
{
    PJACResponseObject *resposneObject = [[PJACResponseObject alloc] init];
    
    NSURL *baseUrl = [NSURL URLWithString:@"http://192.168.1.92:3000"];
    
    NSURL *requestUrl = [NSURL URLWithString:@"" relativeToURL:baseUrl];
    resposneObject.serverNumber = sender.tag;
    
    NSMutableURLRequest *apiRequest = [NSMutableURLRequest requestWithURL:requestUrl];
    
    apiRequest.HTTPMethod = @"GET";
    
    [NSURLConnection sendAsynchronousRequest:apiRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                               
                               resposneObject.responseText = json;
                               
                               [self.responses addObject:resposneObject];
                               
                               NSIndexPath *cellIndex = [NSIndexPath indexPathForRow:self.responses.count - 1 inSection:0];
                               
                               [self.tableView insertRowsAtIndexPaths:@[cellIndex] withRowAnimation:UITableViewRowAnimationFade];
                               
                           }];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    PJACTableViewCell *theCell = (PJACTableViewCell *)cell;
    
    if (!theCell.hasTransformed) {
        theCell.transform = CGAffineTransformMakeTranslation(0, 300);
        [UIView animateWithDuration:1.0f
                         animations:^{
                             theCell.transform = CGAffineTransformIdentity;
                             theCell.hasTransformed = YES;
                        
                         }];
    }


    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PJACTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"responseCell"];
    if (!cell) {
        cell = [[PJACTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"responseCell"];
    }
    PJACResponseObject *currentObject = [self.responses objectAtIndex:indexPath.row];
    
    cell.responseLabel.text = currentObject.responseText;
    UIColor *color;
    if (currentObject.serverNumber == 1) {
        color = [UIColor redColor];
    } else if (currentObject.serverNumber == 2){
        color = [UIColor greenColor];
    } else {
        color = [UIColor purpleColor];
    }
    cell.backgroundColor = color;
    
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.responses.count;
}

@end
