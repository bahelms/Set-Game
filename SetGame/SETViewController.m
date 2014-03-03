//
//  SETViewController.m
//  SetGame
//
//  Created by Barrett Helms on 2/28/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//
#import "SETViewController.h"
#import "SETGame.h"

@interface SETViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *matchAlerts;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) SETGame *game;
@end

@implementation SETViewController
#pragma mark - Initialization

- (SETGame *)game {
    if (!_game) _game = [self createGame];
    return _game;
}


- (SETGame *)createGame {
    return [[SETGame alloc] initWithCardCount:[self.cardButtons count]
                                    usingDeck:[SETDeck deck]];
}


- (void)dealCards {
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        SETCard *card = [self.game cardAtIndex:cardButtonIndex];
        // Draw stuff
        
    }
}


#pragma mark - Actions

- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}


#pragma mark - View Stuff

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        SETCard *card = [self.game cardAtIndex:cardButtonIndex];
        // Draw stuff
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %lu", (long)self.game.score];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self dealCards];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
