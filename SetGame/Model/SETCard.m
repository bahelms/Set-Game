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
//    NSArray *properties = @[@"shape", @"alpha", @"color", @"number"];
//    NSMutableArray *matches = [NSMutableArray array];
//    
//    for (NSString *property in properties) {
//        [matches addObject:@([self matchAttribute:property withOtherCards:otherCards)]);
//    }
    
    BOOL shape_set = [self matchAttribute:@"shape" withOtherCards:otherCards];
    BOOL alpha_set = [self matchAttribute:@"alpha" withOtherCards:otherCards];
    BOOL color_set = [self matchAttribute:@"color" withOtherCards:otherCards];
    BOOL number_set = [self matchAttribute:@"number" withOtherCards:otherCards];
    
    if (shape_set && alpha_set && color_set && number_set) score = 1;
//    if (![matches containsObject:@(NO)]) score = 1;
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
