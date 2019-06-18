//
//  CategoryViewController.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-09.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CategoryViewController.h"

#import "Categories.h"
#import "Category.h"
#import "QuestionUIController.h"
#import "DisclaimerViewController.h"
#import "BlogViewController.h"


@implementation CategoryViewController
@synthesize catList;
NSInteger _lineSize;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Categories";
        //self.tabBarItem.image = [UIImage imageNamed:@""];
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        [self.navigationController.navigationBar setTintColor: [[UIColor alloc] initWithRed:0.25 green:0.0 blue:0.0 alpha:1.0]];
    //Setup array

    Categories *cats = [Categories sharedManager];
	catList = [cats.getList mutableCopy];
	[self setTitle:@"Categories"];
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
#pragma - Tableview Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return catList.count;
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
	Category *category = [catList objectAtIndex:indexPath.row];
	cell.textLabel.text = category.name;

    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:17];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
  
    
    //Step 4: return index row
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	Category *category = [catList objectAtIndex:indexPath.row];
    CGSize size = [ category.name
                   sizeWithFont:[UIFont fontWithName:@"Arial" size:17]
                   constrainedToSize:CGSizeMake(220,CGFLOAT_MAX)];   
    return size.height + 15;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.textColor = (indexPath.row%2)?[UIColor whiteColor]: [UIColor blackColor];

    cell.backgroundColor = (indexPath.row%2)?[[UIColor alloc] initWithRed:.25 green:.00 blue:.00 alpha:1]:[UIColor clearColor];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Category *category = [catList objectAtIndex:indexPath.row];
    
    
    if ([(category.name) isEqualToString:(@"Disclaimer")]) {
        DisclaimerViewController *dvc = [[DisclaimerViewController alloc] initWithNibName:@"DisclaimerViewController" bundle:nil];
        [self.navigationController pushViewController:dvc animated:YES];
        [dvc release];
    }
    else if ([category.name isEqualToString:(@"Blogs")])
    {
        
        BlogViewController *blogs = [[BlogViewController alloc] initWithNibName:@"BlogViewController" bundle:nil];
        [self.navigationController pushViewController:blogs animated:YES];
        [blogs release];
         /*
        BlogsiewController *blogs = [[BlogsiewController alloc] initWithNibName:@"BlogsiewController" bundle:nil];
        [self.navigationController pushViewController:blogs animated:YES];
        [blogs release];
          */
    }
    else
    {
        QuestionUIController *qas = [[QuestionUIController alloc] initWithNibName:@"QuestionUIController" bundle:nil];
   
        qas.selectedCategory = category.name;
        [qas setTitle:category.name];
	
        [self.navigationController pushViewController:qas animated:YES];
        [qas release];
    }
	
}



@end
