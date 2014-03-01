//
//  SETGame.h
//  SetGame
//
//  Created by Barrett Helms on 2/28/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SETDeck.h"
#import "SETCard.h"

@interface SETGame : NSObject

// Designated init
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(SETDeck *)deck;

@end
