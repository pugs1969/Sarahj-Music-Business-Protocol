//
//  CategoryViewController.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-09.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray * catList;
    NSMutableArray  *categoryList;
}

@property (nonatomic, retain) NSMutableArray * catList;

@end
