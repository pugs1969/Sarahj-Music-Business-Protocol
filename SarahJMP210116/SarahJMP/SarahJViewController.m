//
//  SarahJViewController.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-06-09.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SarahJViewController.h"

@implementation SarahJViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Sarah J";
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320,750)];
    [super viewDidLoad];
    [self.navigationController.navigationBar setTintColor: [[UIColor alloc] initWithRed:0.25 green:0.0 blue:0.0 alpha:1.0]];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
