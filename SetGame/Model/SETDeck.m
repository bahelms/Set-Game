//
//  SETDeck.m
//  SetGame
//
//  Created by Barrett Helms on 2/28/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//
#import "SETDeck.h"
#import "SETCard.h"

@interface SETDeck ()
@property (nonatomic) NSMutableArray *cards;
@end

@implementation SETDeck
#pragma mark - Init

// Designated init
+ (SETDeck *)deck {
    return [[self alloc] init];
}

            
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
                        [self addCard:card];
                    }
                }
            }
        }
    }
    return self;
}


- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


#pragma mark - Instance methods

- (void)addCard:(SETCard *)card {
    [self.cards addObject:card];
}


- (SETCard *)drawRandomCard {
    SETCard *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned i = arc4random() % [self.cards count];
        randomCard = self.cards[i];
        [self.cards removeObjectAtIndex:i];
    }
    return randomCard;
}

@end
