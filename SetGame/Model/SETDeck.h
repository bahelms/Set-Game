//
//  SETDeck.h
//  SetGame
//
//  Created by Barrett Helms on 2/28/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SETCard.h"

@interface SETDeck : NSObject

+ (SETDeck *)deck;  // Designated init
- (void)addCard:(SETCard *)card;
- (SETCard *)drawRandomCard;

@end
