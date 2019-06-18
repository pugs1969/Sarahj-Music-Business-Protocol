//
//  SearchViewController.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-06-09.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SearchViewController.h"
#import "CatQA.h"
#import "CatQAController.h"
#import "adviceDomain.h"
#import "AdviceContoller.h"
#import "Category.h"
#import "AnswerUIController.h"

@implementation SearchViewController
@synthesize mySearchBar;
@synthesize myTableView;
@synthesize qaTableData;
@synthesize adviceTableData;

NSInteger numberOfRows;
NSMutableArray *catList;
NSMutableArray *allQA;
NSMutableArray *allAdvice;
NSMutableArray *searchResults;
NSString *textStr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Search";
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
    //bind items
    self.mySearchBar.delegate = self;
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    //init filtered lists
    qaTableData = [[NSMutableArray alloc] init];
    adviceTableData = [[NSMutableArray alloc] init];
    searchResults = [[NSMutableArray alloc] init];    
    
    // Get all items for both arrays
	CatQAController *catCntl = [CatQAController sharedManager];
	allQA = [[catCntl getList:10] mutableCopy];
    allAdvice = [[NSMutableArray alloc]init];
    
    AdviceContoller *adviceCntl = [AdviceContoller sharedManager];
    NSMutableArray *prodList = [[NSMutableArray alloc] init ];
    NSMutableArray *artList = [[NSMutableArray alloc] init ];  
    prodList = [adviceCntl.getProducerList mutableCopy];
    artList = [ adviceCntl.getArtistList mutableCopy];
    
    for(int i = 0; i<[prodList count];i++)
    {
        [allAdvice addObject:[prodList objectAtIndex:i]];
    }
    for(int i = 0; i<[artList count];i++)
    {
        [allAdvice addObject:[artList objectAtIndex:i]];
    }
    [self.navigationController.navigationBar setTintColor: [[UIColor alloc] initWithRed:0.25 green:0.0 blue:0.0 alpha:1.0]];
}
/*
-(void)keyboardShown:(NSNotification*)note
{
    CGRect keyBoardFrame;
    [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyBoardFrame];
    CGRect tableViewFrame = myTableView.frame;
    tableViewFrame.size.height -= keyBoardFrame.size.height;
    [myTableView setFrame:tableViewFrame];
}
*/

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            cell.textLabel.textColor = (indexPath.row%2)?[UIColor whiteColor]: [UIColor blackColor];
            cell.backgroundColor = (indexPath.row%2)?[[UIColor alloc] initWithRed:.25 green:.00 blue:.00 alpha:1]:[UIColor clearColor];
            break;
        case 1:
            cell.textLabel.textColor = (indexPath.row%2)?[UIColor whiteColor]: [UIColor blackColor];            
            cell.backgroundColor = (indexPath.row%2)?[[UIColor alloc] initWithRed:.25 green:.00 blue:.00 alpha:1]:[UIColor clearColor];
            break;
        default:
            break;
    }
	}


- (void)viewDidUnload
{
    [self setMySearchBar:nil];
    [self setMyTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return qaTableData.count;
            break;
        case 1:
            return adviceTableData.count;
            break;
        default:
            return 0;
            break;
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnswerUIController *ac = [[AnswerUIController alloc] initWithNibName:@"AnswerUIController" bundle:nil];
   NSString *title = [self title];  
    
    switch (indexPath.section)
    {
        case 0:
            
            [self.navigationController pushViewController:ac animated:YES];
            [ac release];
            ac.cat = [qaTableData objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
   
   [ac setTitle:title];
    

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Step 1: Check to see if cell row can be reused
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //Step 2: If there are no cells to reuse create a new one
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }  
    
    //Step 3: fill cell with data
    CatQA *catObj = [[CatQA alloc] init];
    adviceDomain *adviceObj = [[adviceDomain alloc] init];
    
    switch (indexPath.section)
    {
        case 0:
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;            
            catObj = [qaTableData objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"<%@> %@", catObj.cat ,catObj.question];
            break;
        case 1:
            cell.accessoryType = UITableViewCellAccessoryNone;
            adviceObj = [adviceTableData objectAtIndex:indexPath.row];
            cell.textLabel.text = adviceObj.advice;
        default:
            break;
    }
    
	cell.textLabel.font = [UIFont fontWithName:@"Arial" size:17];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    //Step 4: return index row
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CatQA *catObj;
    adviceDomain *ad;
    NSString *itemStr;
    CGSize size;
    
    switch (indexPath.section) {
        case 0:
            catObj = [qaTableData  objectAtIndex:indexPath.row];
            itemStr = [NSString stringWithFormat:@"<%@> %@", catObj.cat ,catObj.question];
                size = [ itemStr
                       sizeWithFont:[UIFont fontWithName:@"Arial" size:16]
                       constrainedToSize:CGSizeMake(220,CGFLOAT_MAX)];

            break;
        case 1:
            ad = [adviceTableData objectAtIndex:indexPath.row];
            size = [ ad.advice
                     sizeWithFont:[UIFont fontWithName:@"Arial" size:16]
                     constrainedToSize:CGSizeMake(230,CGFLOAT_MAX)];
            break;
        default:
            break;
    }

    return size.height;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return @"Category Questions";
            break;
        case 1:
            return @"Advise Items";
            break;

    }
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length > 0)
    {
       
        self.getSearchData;
        
        [self.myTableView reloadData];
    }
}

-(void)getSearchData
{
    qaTableData.removeAllObjects;
    adviceTableData.removeAllObjects;

    
    //Get category data
    for(CatQA *catQAObj in allQA)
    {
        
        if([catQAObj.question rangeOfString:self.mySearchBar.text options:NSCaseInsensitiveSearch].location != NSNotFound)
        {
            //NSLog(@"%@     :     %@",q,self.mySearchBar.text);
            [qaTableData addObject:catQAObj];
        }
        else if ([catQAObj.answer rangeOfString:self.mySearchBar.text options:NSCaseInsensitiveSearch].location != NSNotFound)
        {
            [qaTableData addObject:catQAObj];
        }
    }
    
    //Get advice data
    for(adviceDomain *adviceObj in allAdvice)
    {
        if([adviceObj.advice rangeOfString:self.mySearchBar.text options:NSCaseInsensitiveSearch].location != NSNotFound)
        {
            [adviceTableData addObject:adviceObj];
        }
    }

    
    //numberOfRows
    numberOfRows = adviceTableData.count + qaTableData.count;
    
    NSLog(@"FILTERED LIST COUNT: %i", numberOfRows);    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)aSearchBar
{
    [searchBar resignFirstResponder];
}


- (void)dealloc {
    [mySearchBar release];
    [myTableView release];
    [super dealloc];
}
@end
