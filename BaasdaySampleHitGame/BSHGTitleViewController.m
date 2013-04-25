//
//  BSHGTitleViewController.m
//  BaasdaySampleHitGame
//
//  Created by Yuu Shimizu on 4/25/13.
//  Copyright (c) 2013 Nyampass. All rights reserved.
//

#import "BSHGTitleViewController.h"
#import "BSHGGameViewController.h"

@interface BSHGTitleViewController ()

@end

@implementation BSHGTitleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init {
	return [self initWithNibName:@"BSHGTitleViewController" bundle:nil];
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

- (IBAction)startButtonClicked:(id)sender {
	[self presentViewController:[[BSHGGameViewController alloc] init] animated:NO completion:nil];
}

@end
