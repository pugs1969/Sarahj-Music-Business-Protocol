//
//  AdviceUIController.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-25.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdviceUIController : UITableViewController
{
    IBOutlet UITableView *tableview;
    UISegmentedControl *segment;
    NSMutableArray *adviceAList;
    NSMutableArray *advicePList;

}

@property (nonatomic, retain) IBOutlet UISegmentedControl *segment;
@property (nonatomic, retain) NSMutableArray *adviceAList;
@property (nonatomic, retain) NSMutableArray *advicePList;


-(IBAction)segmentChange:(id)sender;
@end
