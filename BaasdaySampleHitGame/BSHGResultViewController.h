//
//  BSHGResultViewController.h
//  BaasdaySampleHitGame
//
//  Created by Yuu Shimizu on 4/25/13.
//  Copyright (c) 2013 Nyampass. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSHGGameViewController.h"
#import <baasday/baasday.h>

@interface BSHGResultViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	NSInteger score_;
	BDListResult *leaderboardEntries_;
	BSHGGameViewController *gameViewController_;
}

@property (nonatomic, retain) IBOutlet UILabel *scoreLabel;

- (id)initWithScore:(NSInteger)score gameViewController:(BSHGGameViewController *)gameViewController;
- (IBAction)retryButtonClicked:(id)sender;

@end
