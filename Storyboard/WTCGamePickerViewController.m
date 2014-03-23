//
//  WTCGamePickerViewController.m
//  Storyboard
//
//  Created by wangtao on 14-1-9.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "WTCGamePickerViewController.h"

@interface WTCGamePickerViewController ()
{
    NSArray *_games;
    NSUInteger _selectedIndex;
}

@end

@implementation WTCGamePickerViewController

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
    NSLog(@"viewDidLoad 3");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _games = @[@"Angry Birds", @"Russian Roulete", @"植物大战僵尸", @"保卫萝卜"];
    _selectedIndex = [_games indexOfObject:self.game];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear 3");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear 3");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear 3");
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"viewDidDisappear 3");
}

- (void)viewWillLayoutSubviews
{
    NSLog(@"viewWillLayoutSubviews 3");
}

- (void)viewDidLayoutSubviews
{
    NSLog(@"viewDidLayoutSubviews 3");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_games count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell" forIndexPath:indexPath];
    cell.textLabel.text = _games[indexPath.row];
    
    if (indexPath.row == _selectedIndex) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_selectedIndex != NSNotFound) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:
                                 [NSIndexPath indexPathForRow:_selectedIndex inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    _selectedIndex = indexPath.row;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GAMEPICKER_NOTIFICATION" object:nil userInfo:@{@"Game": _games[indexPath.row]}];
}

@end
