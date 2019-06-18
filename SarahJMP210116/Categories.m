//
//  Categories.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-07-10.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Categories.h"
#import "Data.h"

@implementation Categories;
static Categories *mySharedManager = nil;

+(id)sharedManager
{
    @synchronized(self)
    {
        if(mySharedManager == nil)
            mySharedManager = [[self alloc] init];
    }
    return mySharedManager;
}

- (id) initWithName: (NSString *) name
{
    self = [super init];
    if (self)
    {
        categoryName = [[NSString alloc ] initWithName: name ];

    }

    return self;
}

-(void) addCategory:(Category *)theCategory
{
    [categoryList addObject: theCategory];
}

-(int) enteries
{
    return [categoryList count];
}

-(void) list
{
    NSLog(@"======= Contents of: %@ =======", categoryName);
    
    for (Category *theCategory in categoryList)
        NSLog (@"%-20s", [theCategory.name UTF8String]);
    
    NSLog (@"=======================================");
}

-(NSMutableArray *) getList
{
    if([categoryList count] == 0)
    {
        categoryList = [[NSMutableArray alloc] init ];
        [self testList];

        for (int i =0; i < [testList count]; i++)
        {
            NSString *item;
            item = [testList objectAtIndex: i];

            Category *cat = [[Category alloc] initWithName:item];

            [categoryList addObject:cat];
        }
 
        
    }
    return categoryList;
    
}

-(void) testList
{
    testList = [[NSMutableArray alloc] init];
 
    [testList addObject: @"Publishing"];
    [testList addObject: @"Royalty"];
    [testList addObject: @"Self Promotion"];
    [testList addObject: @"Blogs"];
    [testList addObject: @"Legal Advice"];
    [testList addObject: @"Production Protocol"];
    [testList addObject: @"Music Submission Protocol"];
    [testList addObject: @"Production/Songwriting Submission Opportunities"];
    [testList addObject: @"Music Submission Opportunities"];
    [testList addObject: @"Booking Information"];
    [testList addObject: @"Disclaimer"];

}



@end
