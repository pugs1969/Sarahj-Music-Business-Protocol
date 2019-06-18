//
//  QuestionUIController.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-11.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionUIController.h"
#import "CatQAController.h"
#import "AnswerUIController.h"
#import "Category.h"

@implementation QuestionUIController
@synthesize selectedCategory;

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
    
    

	CatQAController *qa = [CatQAController sharedManager];
    
    if ([self.title isEqualToString:@"Publishing"])
        questionAnswersList = [[qa getList:0] mutableCopy];  
    if ([self.title isEqualToString:@"Royalty"])
        questionAnswersList = [[qa getList:1] mutableCopy];  
    if ([self.title isEqualToString:@"Self Promotion"])
        questionAnswersList = [[qa getList:2] mutableCopy];  
    if ([self.title isEqualToString:@"Legal Advice"])
        questionAnswersList = [[qa getList:3] mutableCopy];  
    if ([self.title isEqualToString:@"Production Protocol"])
    {
        questionAnswersList = [[qa getList:4] mutableCopy];
        NSLog(@"production count: %i",questionAnswersList.count);
    }
    if ([self.title isEqualToString:@"Music Submission Protocol"])
        questionAnswersList = [[qa getList:5] mutableCopy];  
    if ([self.title isEqualToString:@"Production/Songwriting Submission Opportunities"])
        questionAnswersList = [[qa getList:6] mutableCopy];  
    if ([self.title isEqualToString:@"Music Submission Opportunities"])
        questionAnswersList = [[qa getList:7] mutableCopy];  
  
    if ([self.title isEqualToString:@"Booking Information"])
        questionAnswersList = [[qa getList:8] mutableCopy];  

    
    [super viewDidLoad];
 
        [self.navigationController.navigationBar setTintColor: [[UIColor alloc] initWithRed:0.25 green:0.0 blue:0.0 alpha:1.0]];
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

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return questionAnswersList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //Step 1: Check to see if cell row can be reused

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //Step 2: If there are no cells to reuse create a new one
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    //Add a detail view accessory
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    //Step 3: Set text
	CatQA *catQA = [questionAnswersList objectAtIndex:indexPath.row];
   
    NSLog(@"%@  :  %@",self.title,catQA.cat); 
     
    cell.textLabel.text = catQA.question;
	
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:17];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    //Step 4: return index row
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	CatQA *catQA = [questionAnswersList objectAtIndex:indexPath.row];
    CGSize size;
  
        size = [ catQA.question
                   sizeWithFont:[UIFont fontWithName:@"Arial" size:17]
                   constrainedToSize:CGSizeMake(200,CGFLOAT_MAX)];
    return size.height + 5;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.textColor = (indexPath.row%2)?[UIColor whiteColor]: [UIColor blackColor];

    cell.backgroundColor = (indexPath.row%2)?[[UIColor alloc] initWithRed:.25 green:.00 blue:.00 alpha:1]:[UIColor clearColor];
}


#pragma mark - Table view delegate

    
    -(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        AnswerUIController *ac = [[AnswerUIController alloc] initWithNibName:@"AnswerUIController" bundle:nil];

        int number = (indexPath.row + 1);
        NSString *title = [self title]; 
        ac.cat = [questionAnswersList objectAtIndex:indexPath.row];
        [ac setTitle:title];
        
        [self.navigationController pushViewController:ac animated:YES];
        [ac release];
    }    


@end
