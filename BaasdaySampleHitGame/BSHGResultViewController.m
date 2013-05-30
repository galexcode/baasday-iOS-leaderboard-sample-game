//
//  BSHGResultViewController.m
//  BaasdaySampleHitGame
//
//  Created by Yuu Shimizu on 4/25/13.
//  Copyright (c) 2013 Nyampass. All rights reserved.
//

#import "BSHGResultViewController.h"
#import "BSHGGameViewController.h"
#import <baasday/baasday.h>

@interface BSHGResultViewController ()

@end

@implementation BSHGResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithScore:(NSInteger)score gameViewController:(BSHGGameViewController *)gameViewController {
	self = [self initWithNibName:@"BSHGResultViewController" bundle:nil];
	if (self) {
		score_ = score;
		gameViewController_ = gameViewController;
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	BDLeaderboardEntry *entry = [BDLeaderboardEntry createWithLeaderboardName:@"normalMode" score:score_ error:nil];
	self.scoreLabel.text = [NSString stringWithFormat:@"%d hits! RANK:%d", entry.score, entry.rank];
	BDQuery *query = [[BDQuery alloc] init];
	query.skip = 0;
	query.limit = 100;
	leaderboardEntries_ = [BDLeaderboardEntry fetchAllWithLeaderboardName:@"normalMode" query:query error:nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return leaderboardEntries_.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
	
	BDLeaderboardEntry *entry = leaderboardEntries_.contents[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"[%d] %d hits", entry.rank, entry.score];
    return cell;
}

- (IBAction)retryButtonClicked:(id)sender {
	[gameViewController_ reset];
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
