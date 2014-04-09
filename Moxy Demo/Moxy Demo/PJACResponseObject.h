//
//  PJACResponseObject.h
//  Moxy Demo
//
//  Created by Andrew Crites on 4/9/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PJACResponseObject : NSObject

@property (strong, nonatomic) NSString *responseText;
@property (nonatomic) NSInteger serverNumber;

@end
