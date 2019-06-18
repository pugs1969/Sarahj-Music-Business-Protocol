//
//  QuestionsController.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-08-29.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsController : UITableViewController
{
    NSMutableArray *questionAnswersList;
    NSString *selectedCategory;
    
}

@property (nonatomic, retain) NSString *selectedCategory;
@property (nonatomic, retain) NSMutableArray *questionAnswerList;

@end
