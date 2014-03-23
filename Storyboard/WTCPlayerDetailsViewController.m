//
//  WTCPlayerDetailsViewController.m
//  Storyboard
//
//  Created by wangtao on 14-1-9.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "WTCPlayerDetailsViewController.h"
#import "WTCGamePickerViewController.h"
#import "WTCPlayer.h"
#import "WTCGamePickerViewController.h"

@interface WTCPlayerDetailsViewController ()
{
    NSString *_game;
}

@end

@implementation WTCPlayerDetailsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark view controller lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad 2");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 注册选择游戏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gamePickerNotification:) name:@"GAMEPICKER_NOTIFICATION" object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear 2");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear 2");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear 2");
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"viewDidDisappear 2");
}

- (void)viewWillLayoutSubviews
{
    NSLog(@"viewWillLayoutSubviews 2");
}

- (void)viewDidLayoutSubviews
{
    NSLog(@"viewDidLayoutSubviews 2");
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"init WTCPlayerDetailsViewController");
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"GAMEPICKER_NOTIFICATION" object:nil];
    NSLog(@"dealloc WTCPlayerDetailsViewController");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.ibPlayerNameTextField becomeFirstResponder];
    }
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}

- (void)gamePickerNotification:(NSNotification *)notification
{
    _game = (NSString *)[notification.userInfo objectForKey:@"Game"];
    self.ibDetailLabel.text = _game;
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)ibCancelAction:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CANCEL_NOTIFICATION" object:nil];
}

- (IBAction)ibAddAction:(id)sender {
    WTCPlayer *player = [[WTCPlayer alloc] init];
    player.name = self.ibPlayerNameTextField.text;
    player.game = _game;
    player.rating = 3;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:player, @"Player", nil];
    NSNotification *saveNotification = [NSNotification notificationWithName:@"SAVE_NOTIFICATION" object:nil userInfo:dictionary];
    [[NSNotificationCenter defaultCenter] postNotification:saveNotification];
}

@end
