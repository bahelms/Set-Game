//
//  SETCard.m
//  SetGame
//
//  Created by Barrett Helms on 2/28/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//
#import "SETCard.h"

@implementation SETCard

- (NSInteger)match:(NSArray *)otherCards {
    NSInteger score = 0;
    NSArray *attributes = @[@"shape", @"alpha", @"color", @"number"];
    NSMutableArray *matches = [NSMutableArray array];
    
    for (NSString *attribute in attributes)
        [matches addObject:@([self matchAttribute:attribute withOtherCards:otherCards])];
  
    if (![matches containsObject:@(NO)]) score = 1;
    return score;
}


- (BOOL)matchAttribute:(NSString *)attribute withOtherCards:(NSArray *)otherCards {
    BOOL setMatch = NO;
    NSInteger firstAttribute = (NSInteger)[self valueForKey:attribute];
    NSInteger secondAttribute = (NSInteger)[[otherCards firstObject] valueForKey:attribute];
    NSInteger thirdAttribute = (NSInteger)[[otherCards lastObject] valueForKey:attribute];
    
    if (firstAttribute == secondAttribute && firstAttribute == thirdAttribute)
        setMatch = YES;
    else if (firstAttribute != secondAttribute && firstAttribute != thirdAttribute && secondAttribute != thirdAttribute)
        setMatch = YES;
    
    return setMatch;
}

@end
