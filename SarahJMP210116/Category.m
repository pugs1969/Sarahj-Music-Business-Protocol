//
//  Category.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-07-08.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Category.h"

@implementation Category
@synthesize name;

-(id) initWithName: (NSString *) categoryName
{
    self = [super init];
    
    if(self)
    {
        self.name = categoryName;
    }
    return self;
}

-(void) print
{
    NSLog(@"Category name: %-31s",[name UTF8String]);
}

@end
