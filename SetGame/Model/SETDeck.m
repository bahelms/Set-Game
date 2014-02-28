//
//  SETDeck.m
//  SetGame
//
//  Created by Barrett Helms on 2/28/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//
#import "SETDeck.h"
#import "SETCard.h"

@implementation SETDeck

- (instancetype)init {
    if (self = [super init]) {
        for (int shape=0; shape < 3; shape++) {
            for (int alpha=0; alpha < 3; alpha++) {
                for (int color=0; color < 3; color++) {
                    for (int number=0; number < 3; number++) {
                        SETCard *card = [[SETCard alloc] init];
                        card.shape = shape;
                        card.alpha = alpha;
                        card.color = color;
                        card.number = number;
                    }
                }
            }
        }
    }
    return self;
}

@end
