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

#pragma mark - Init
static const int MATCH_LIMIT = 2;
static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 1;

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


- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


#pragma mark - Methods

- (SETCard *)cardAtIndex:(NSInteger)index {
    return self.cards[index];
}


- (void)chooseCardAtIndex:(NSInteger)index {
    SETCard *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            NSMutableArray *chosenCards = [self findChosenCards];
            if ( !([chosenCards count] < MATCH_LIMIT))
                [self match:card withCards:chosenCards];
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}


- (NSMutableArray *)findChosenCards {
    NSMutableArray *chosenCards = [NSMutableArray array];
    
    for (SETCard *otherCard in self.cards) {
        if (otherCard.isChosen && !otherCard.isMatched && [chosenCards count] < MATCH_LIMIT) {
            [chosenCards addObject:otherCard];
        }
    }
    return chosenCards;
}


- (void)match:(SETCard *)card withCards:(NSMutableArray *)chosenCards {
    NSInteger matchScore = [card match:chosenCards];
    
    if (matchScore) {
        self.score += matchScore;
        card.matched = YES;
        for (SETCard *otherCard in chosenCards) { otherCard.matched = YES; }
    } else {
        self.score -= MISMATCH_PENALTY - COST_TO_CHOOSE;
        for (SETCard *otherCard in chosenCards) { otherCard.chosen = NO; }
    }
}

@end
