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
    return [[SETGame all]]
}


#pragma mark - View Stuff

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions

- (IBAction)touchCardButton:(UIButton *)sender {
}

@end
