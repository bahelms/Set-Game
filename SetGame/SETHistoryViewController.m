//
//  SETHistoryViewController.m
//  SetGame
//
//  Created by Barrett Helms on 3/11/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//
#import "SETHistoryViewController.h"

@interface SETHistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *matchHistoryTextView;
@end

@implementation SETHistoryViewController

- (void)setMatchHistory:(NSMutableAttributedString *)matchHistory {
    if ([matchHistory length] == 0)
        matchHistory = [[NSMutableAttributedString alloc] initWithString:@"Zero matches!"];
    
    _matchHistory = matchHistory;
    if (self.view.window) [self updateUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)updateUI {
    self.matchHistoryTextView.attributedText = self.matchHistory;
    self.matchHistoryTextView.textAlignment = NSTextAlignmentCenter;
}

@end
