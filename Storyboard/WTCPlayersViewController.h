//
//  WTCPlayersViewController.h
//  Storyboard
//
//  Created by wangtao on 14-1-8.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCPlayersViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *players;

// 只能有NSNotification一个参数
- (void)cancelNotification:(NSNotification *)notification;

- (void)saveNotification:(NSNotification *)notification;

@end
