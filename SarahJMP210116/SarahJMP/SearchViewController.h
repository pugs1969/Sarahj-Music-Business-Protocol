//
//  SearchViewController.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-06-09.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//



@interface SearchViewController : UIViewController <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>


{
    NSMutableArray *qaTableData;
    NSMutableArray *adviceTableData;
    IBOutlet UITableView *tableView;
    IBOutlet UISearchBar *searchBar;
    
    UIView *disableViewOverlay;
    
    UISearchBar *mySearchBar;
    UITableView *myTableView;
}
@property (nonatomic, retain) IBOutlet UISearchBar *mySearchBar;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) NSMutableArray *qaTableData;
@property (nonatomic, retain) NSMutableArray *adviceTableData;


-(void)getSearchData;

@end
