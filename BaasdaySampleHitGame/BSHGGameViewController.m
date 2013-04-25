//
//  BSHGGameViewController.m
//  BaasdaySampleHitGame
//
//  Created by Yuu Shimizu on 4/25/13.
//  Copyright (c) 2013 Nyampass. All rights reserved.
//

#import "BSHGGameViewController.h"
#import "BSHGResultViewController.h"

@interface BSHGGameViewController ()

@end

@implementation BSHGGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		count_ = 0;
    }
    return self;
}

- (id)init {
	return [self initWithNibName:@"BSHGGameViewController" bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setRestTimeLabel:(NSTimeInterval)restTime {
	if (restTime < 0) restTime = 0;
	self.timeLabel.text = [NSString stringWithFormat:@"%.3lf", restTime];
}

- (void)reset {
	count_ = 0;
	self.countLabel.text = @"0";
	[self setRestTimeLabel:10];
}

- (void)onTimer {
	NSTimeInterval restTime = 10.0 - [[NSDate date] timeIntervalSinceDate:startedAt_];
	[self setRestTimeLabel:restTime];
	if (restTime <= 0) {
		[timer_ invalidate];
		timer_ = nil;
		[self presentViewController:[[BSHGResultViewController alloc] initWithScore:count_ gameViewController:self] animated:NO completion:nil];
	}
}

- (IBAction)hitButtonClicked:(id)sender {
	if (!timer_) {
		startedAt_ = [NSDate date];
		timer_ = [NSTimer scheduledTimerWithTimeInterval:50.0/1000 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
		[timer_ fire];
	}
	count_++;
	self.countLabel.text = [NSString stringWithFormat:@"%d", count_];
}

@end
