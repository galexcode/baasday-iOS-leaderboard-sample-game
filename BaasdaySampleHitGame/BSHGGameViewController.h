//
//  BSHGGameViewController.h
//  BaasdaySampleHitGame
//
//  Created by Yuu Shimizu on 4/25/13.
//  Copyright (c) 2013 Nyampass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSHGGameViewController : UIViewController {
	NSInteger count_;
	NSDate *startedAt_;
	NSTimer *timer_;
}

@property (nonatomic, retain) IBOutlet UILabel *countLabel;
@property (nonatomic, retain) IBOutlet UILabel *timeLabel;

- (void)reset;

- (IBAction)hitButtonClicked:(id)sender;

@end
