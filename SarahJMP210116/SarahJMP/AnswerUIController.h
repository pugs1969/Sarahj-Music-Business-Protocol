//
//  AnswerUIController.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-13.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatQA.h"

@interface AnswerUIController : UITableViewController
{
    CatQA *cat;}

@property (nonatomic, retain) CatQA *cat;
@end
