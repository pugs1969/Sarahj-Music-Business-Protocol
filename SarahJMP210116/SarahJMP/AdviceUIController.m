//
//  AdviceUIController.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-25.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AdviceUIController.h"
#import "adviceDomain.h"
#import "AdviceContoller.h"

@implementation AdviceUIController
@synthesize segment, adviceAList, advicePList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Advice";

        //self.tabBarItem.image = [UIImage imageNamed:@""];
    }
    return self;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
	AdviceContoller *ac = [AdviceContoller sharedManager];
	adviceAList = [ac.getArtistList mutableCopy];
     
	advicePList = [ac.getProducerList mutableCopy]; 
    
    [super viewDidLoad];
    
        [self.navigationController.navigationBar setTintColor: [[UIColor alloc] initWithRed:0.25 green:0.0 blue:0.0 alpha:1.0]];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (segment.selectedSegmentIndex == 0)
        return adviceAList.count;
    else
        return advicePList.count;    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // NSLog(@"segment selected: %i",segment.selectedSegmentIndex);
    // Configure the cell...
    if(segment.selectedSegmentIndex == 0)
    {
        self.title = @"Advice - Artists";
        adviceDomain *ad = [adviceAList objectAtIndex:indexPath.row];
        cell.textLabel.text = ad.advice;

    }
    if(segment.selectedSegmentIndex == 1)
    {
        self.title = @"Advice - Producers";
        adviceDomain *ad = [advicePList objectAtIndex:indexPath.row];
        cell.textLabel.text = ad.advice;

    }    
   
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:17];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;    
    return cell;
}


-(IBAction)segmentChange:(id)sender
{
        [self.tableView reloadData];
}



#pragma mark - Table view delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size;
	 
    if(segment.selectedSegmentIndex == 0)
    {
  
            adviceDomain *ad = [adviceAList objectAtIndex:indexPath.row];
            size = [ ad.advice
                       sizeWithFont:[UIFont fontWithName:@"Arial" size:16]
                       constrainedToSize:CGSizeMake(220,CGFLOAT_MAX)];
    }
    if(segment.selectedSegmentIndex == 1)
    {
            adviceDomain *ad = [advicePList objectAtIndex:indexPath.row];
        size = [ ad.advice
                    sizeWithFont:[UIFont fontWithName:@"Arial" size:16]
                    constrainedToSize:CGSizeMake(220,CGFLOAT_MAX)];
    }    
    
    return size.height;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.textColor = (indexPath.row%2)?[UIColor whiteColor]: [UIColor blackColor];
	//cell.backgroundColor = (indexPath.row%2)?[[UIColor alloc] initWithRed:.76 green:.44 blue:.44 alpha:1]:[UIColor clearColor];
    cell.backgroundColor = (indexPath.row%2)?[[UIColor alloc] initWithRed:.25 green:.00 blue:.00 alpha:1]:[UIColor clearColor];
}

@end
