//
//  SETViewController.m
//  SetGame
//
//  Created by Barrett Helms on 2/28/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//
#import "SETViewController.h"
#import "SETHistoryViewController.h"
#import "SETGame.h"

@interface SETViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchAlertLabel;

@property (nonatomic, readonly) NSArray *shapes;
@property (nonatomic, readonly) NSArray *alphas;
@property (nonatomic, readonly) NSArray *colors;
@property (nonatomic) SETGame *game;
@property (nonatomic) NSMutableArray *matchHistory;
@property (nonatomic) NSInteger gameScore;
@property (nonatomic) NSMutableArray *chosenCards;
@end


@implementation SETViewController

#pragma mark - Initialization

@synthesize shapes = _shapes;
- (NSArray *)shapes {
    if (!_shapes) _shapes = @[@"●", @"◼︎", @"▲"];
    return _shapes;
}


@synthesize alphas = _alphas;
- (NSArray *)alphas {
    if (!_alphas) _alphas = @[@0.2, @0.5, @1];
    return _alphas;
}


@synthesize colors = _colors;
- (NSArray *)colors {
    if (!_colors) _colors = @[[UIColor blueColor], [UIColor purpleColor], [UIColor redColor]];
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


- (NSMutableArray *)matchHistory {
    if (!_matchHistory) _matchHistory = [NSMutableArray array];
    return _matchHistory;
}


- (NSMutableArray *)chosenCards {
    if (!_chosenCards) _chosenCards = [NSMutableArray array];
    return _chosenCards;
}


#pragma mark - Actions

- (IBAction)touchCardButton:(UIButton *)sender {
    int index = [self.cardButtons indexOfObject:sender];
    SETCard *card = [self.game cardAtIndex:index];
    self.matchAlertLabel.attributedText = nil;
    
    [self.game chooseCardAtIndex:index];
    if (card.isChosen)
        self.matchAlertLabel.attributedText = [self getCardTitleFor:card];
    
    if ([self.chosenCards containsObject:card])
        [self.chosenCards removeObject:card];
    else
        [self.chosenCards addObject:card];
    
    [self updateUI];
}


- (IBAction)touchDealAgainButton:(UIButton *)sender {
    self.game = nil;
    self.matchAlertLabel.attributedText = nil;
    self.chosenCards = nil;
    [self updateUI];
}


#pragma mark - View Stuff

- (void)drawCards {
    for (UIButton *cardButton in self.cardButtons) {
        [cardButton setAlpha:1];
        [cardButton setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
        
        NSInteger index = [self.cardButtons indexOfObject:cardButton];
        SETCard *card = [self.game cardAtIndex:index];
        
        [cardButton setAttributedTitle:[self getCardTitleFor:card]
                              forState:UIControlStateNormal];
        
        if (card.isChosen) [cardButton setAlpha:0.5];
        if (card.isMatched) [cardButton setBackgroundImage:nil forState:UIControlStateNormal];
    }
}


- (NSMutableAttributedString *)getCardTitleFor:(SETCard *)card {
    NSMutableString *str = [[NSMutableString alloc] init];
    for (NSInteger i = card.number+1; i > 0; i--)
        [str appendString:self.shapes[card.shape]];
    
    CGFloat alpha = [self.alphas[card.alpha] floatValue];
    UIColor *color = self.colors[card.color];
    NSDictionary *attrs = @{
        NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline],
        NSForegroundColorAttributeName: [color colorWithAlphaComponent:alpha]
    };
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:str
                                                                              attributes:attrs];
    return title;
}


- (void)updateUI {
    [self drawCards];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    
    if ([self.chosenCards count] == 3) {
        [self recordMatchHistory];
        self.matchAlertLabel.attributedText = [self.matchHistory lastObject];
    }
}


- (void)recordMatchHistory {
    NSString *str = ([[self.chosenCards firstObject] isMatched]) ? @"Set!  " : @"No Set!  ";
    NSMutableAttributedString *space = [[NSMutableAttributedString alloc] initWithString:@" | "
                                                                              attributes:nil];
    NSMutableAttributedString *match = [[NSMutableAttributedString alloc] initWithString:str
                                                                              attributes:nil];
    
    for (int i=0; i < 2; i++) {
        [match appendAttributedString:[self getCardTitleFor:self.chosenCards[i]]];
        [match appendAttributedString:space];
    }
    [match appendAttributedString:[self getCardTitleFor:[self.chosenCards lastObject]]];
    
    [self.matchHistory addObject:match];
    self.chosenCards = nil;
}

             
- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawCards];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Set Game History"]) {
        if ([segue.destinationViewController isKindOfClass:[SETHistoryViewController class]]) {
            SETHistoryViewController *historyVC = segue.destinationViewController;
            historyVC
        }
    }
}

@end
