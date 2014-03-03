//
//  SETCard.h
//  SetGame
//
//  Created by Barrett Helms on 2/28/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface SETCard : NSObject

@property (nonatomic) NSInteger shape;
@property (nonatomic) NSInteger alpha;
@property (nonatomic) NSInteger number;
@property (nonatomic) NSInteger color;
@property (nonatomic, getter=isMatched) BOOL matched;
@property (nonatomic, getter=isChosen) BOOL chosen;

- (NSInteger)match:(NSArray *)otherCards;

@end
