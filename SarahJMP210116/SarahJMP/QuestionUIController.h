//
//  QuestionUIController.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-11.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionUIController : UITableViewController
{
    NSMutableArray *questionAnswersList;
    NSString *selectedCategory;
    
}

@property (nonatomic, retain) NSString *selectedCategory;
@property (nonatomic, retain) NSMutableArray *questionAnswerList;
@end
