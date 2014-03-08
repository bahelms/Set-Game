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

@property (nonatomic, readonly) NSArray *shapes;
@property (nonatomic, readonly) NSArray *alphas;
@property (nonatomic, readonly) NSArray *colors;
@end


@implementation SETViewController

#pragma mark - Initialization

@synthesize shapes = _shapes;
@synthesize alphas = _alphas;
@synthesize colors = _colors;

- (NSArray *)shapes {
    if (!_shapes) _shapes = @[@"●", @"◼︎", @"▲"];
    return _shapes;
}


- (NSArray *)alphas {
    if (!_alphas) _alphas = @[@0.3, @0.6, @1];
    return _alphas;
}


- (NSArray *)colors {
    if (!_colors) _colors = @[[UIColor blueColor], [UIColor greenColor], [UIColor redColor]];
    return _colors;
}


- (SETGame *)game {
    if (!_game) _game = [self createGame];
    return _game;
}


- (SETGame *)createGame {
    return [[SETGame alloc] initWithCardCount:[self.cardButtons count]
                                    usingDeck:[SETDeck deck]];
}


#pragma mark - Actions

- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (IBAction)touchDealAgainButton:(UIButton *)sender {
    self.game = nil;
    [self updateUI];
}

#pragma mark - View Stuff

- (void)drawCards {
    for (UIButton *cardButton in self.cardButtons) {
        NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        SETCard *card = [self.game cardAtIndex:cardButtonIndex];
        [self setButtonTitleFor:cardButton with:card];
        
        if (card.isMatched) [cardButton setAlpha:0.5];
    }
}


- (void)setButtonTitleFor:(UIButton *)cardButton with:(SETCard *)card {
    NSMutableString *str = [[NSMutableString alloc] init];
    for (NSInteger i = card.number+1; i > 0; i--) {
        [str appendString:self.shapes[card.shape]];
    }
    
    CGFloat alpha = [self.alphas[card.alpha] floatValue];
    UIColor *color = self.colors[card.color];
    NSDictionary *attrs = @{
        NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline],
        NSForegroundColorAttributeName: [color colorWithAlphaComponent:alpha]
    };
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:str
                                                                attributes:attrs];
    [cardButton setAttributedTitle:title forState:UIControlStateNormal];
}


- (void)updateUI {
    [self drawCards];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
}

             
- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawCards];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
