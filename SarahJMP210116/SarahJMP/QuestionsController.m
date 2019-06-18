//
//  QuestionsController.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-08-29.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionsController.h"
#import "CatQAController.h"

@implementation QuestionsController

@synthesize selectedCategory;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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

    // Do any additional setup after loading the view from its nib.
    //Setup array
	
	questionAnswersList = [[CatQA alloc] init ];
    
	CatQAController *qa = [[CatQAController alloc] init];
	questionAnswersList = [qa.getList mutableCopy];
	//NSLog(@" Controller: %i",[questionAnswersList count]);
    
    
    [super viewDidLoad];}

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

-(void) dealloc
{
    [questionAnswersList release];
    [super dealloc];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
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
    NSLog(@"Hello");
    if(catQA.cat == [self title])
    {
        cell.textLabel.text = catQA.question;
    }
	
    
	cell.textLabel.font = [UIFont systemFontOfSize:17];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    
    //Step 4: return index row
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

	CatQA *catQA = [questionAnswersList objectAtIndex:indexPath.row];
    CGSize size = [ catQA.question
                   sizeWithFont:[UIFont systemFontOfSize:17]
                   constrainedToSize:CGSizeMake(200,CGFLOAT_MAX)];
    
    return size.height + 10;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	cell.backgroundColor = (indexPath.row%2)?[UIColor lightGrayColor]:[UIColor clearColor];
}


@end
