//
//  Data.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-08-27.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Data.h"

@implementation Data

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


-(NSMutableArray *) categoryList
{
    strList = [[NSMutableArray alloc] init];
    [strList addObject: @"Publishing"];
    [strList addObject: @"Royalty"];
    [strList addObject: @"Self Promotion"];
    [strList addObject: @"Blogs"];
    [strList addObject: @"Legal Advice"];
    [strList addObject: @"Procduction Protocol"];
    [strList addObject: @"Music Submission Protocol"];
    [strList addObject: @"Production/Songwriting Submission Opportunities"];
    [strList addObject: @"Music Submission Opportunities"];
    [strList addObject: @"Sarah J's Advice (Artist/Producer)"];
    [strList addObject: @"Booking Information"];
    
    return strList;
}

@end
