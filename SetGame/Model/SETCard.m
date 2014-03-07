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
    BOOL matched = NO;
    SETCard *firstCard = [otherCards firstObject];
    SETCard *secondCard = [otherCards lastObject];
    
    if (self.shape == firstCard.shape && self.shape == secondCard.shape) {
        score = 1;
        matched = YES;
    }
    return score;
}

@end
