//
//  WTCPlayerDetailsViewController.h
//  Storyboard
//
//  Created by wangtao on 14-1-9.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCPlayerDetailsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *ibDetailLabel;
@property (weak, nonatomic) IBOutlet UITextField *ibPlayerNameTextField;
- (IBAction)ibCancelAction:(id)sender;
- (IBAction)ibAddAction:(id)sender;

- (void)gamePickerNotification:(NSNotification *)notification;

@end
