//
//  Categories.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-07-10.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Category.h"
#import "Data.h"

@interface Categories : NSObject
{
    NSString        *categoryName;
    NSMutableArray  *categoryList;
    NSMutableArray  *testList;
    Data *dataList;
}


-(void) addCategory: (Category *) theCategory;
-(int) enteries;
-(void) list;
+(id)sharedManager;
-(NSMutableArray *) getList;
-(void) testList;
//-(void) dealloc;

@end
