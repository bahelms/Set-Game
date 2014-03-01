//
//  SETGame.m
//  SetGame
//
//  Created by Barrett Helms on 2/28/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//
#import "SETGame.h"

@interface SETGame ()
@property (nonatomic) NSMutableArray *cards;
@end


@implementation SETGame

// Designated init
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(SETDeck *)deck
{
    if (self = [super init]) {
        for (int i=0; i < count; i++) {
            SETCard *card = [deck drawRandomCard];
            [self.cards addObject:card];
        }
    }
    return self;
}

@end
