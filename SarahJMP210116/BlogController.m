//
//  BlogController.m
//  SarahJMP
//
//  Created by Lee Beatzz on 2015-09-28.
//
//

#import "BlogController.h"
//#import "Data.h"

@implementation BlogController;
static BlogController *mySharedManager = nil;

+ (id)sharedManager
{
    @synchronized(self)
    {
        if(mySharedManager == nil)
            mySharedManager = [[self alloc] init];
    }
    return mySharedManager;

}

- (id)init {
    self = [super init];
    return self;
}
                       
- (void)dealloc
{
    
}
/*
- (id) initWithName: (NSString *) name
{
    //self = [super init];
    if (self)
    {
        blogName = [[NSString alloc] initWithName: name ];
        
    }
    
    return self;
}

-(void) addBlog:(BlogDomain *) theBlog
{
    [blogList addObject: theBlog];
}

-(int) enteries
{
    return [blogList count];
}

-(void) list
{
    NSLog(@"======= Contents of: %@ =======", blogName);
    
    for (BlogDomain *theBlog in blogList)
        NSLog (@"%-20s", [theBlog.name UTF8String]);
    
    NSLog (@"=======================================");
}

-(NSMutableArray *) getList
{
    if([blogList count] == 0)
    {
        blogList = [[NSMutableArray alloc] init ];
        [self testList];
        
        for (int i =0; i < [testList count]; i++)
        {
            NSString *item;
            item = [testList objectAtIndex: i];
            
            BlogDomain *blog = [[Category alloc] initWithName:item];
            
            [blogList addObject:blog];
        }
        
        
    }
    return categoryList;
    
}
*/
-(NSMutableArray *) testList
{
    NSMutableArray *testList = [[NSMutableArray alloc] init];
    
    [testList addObject: @"Key Blogs you should familiarize yourself with and potentially seek the attention of"];
    [testList addObject: @"Rapradar.com"];
    [testList addObject: @"Inflexwetrust.com"];
    [testList addObject: @"Globalgrind.com"];
    [testList addObject: @"2dopeboyz.com"];
    [testList addObject: @"Rap-up.com"];
    [testList addObject: @"Youheardthatnew.com"];
    [testList addObject: @"Hotnewhiphop.com"];
    [testList addObject: @"Rapgenius.com"];
    [testList addObject: @"Hiphopwired.com"];
    [testList addObject: @"Vladtv.com"];
    [testList addObject: @"Worldstarhiphop.com"];
    [testList addObject: @"Djbooth.net"];
    [testList addObject: @"Sohh.com"];
    [testList addObject: @"Hiphopdx.com"];
    [testList addObject: @"Allhiphop.com"];
    [testList addObject: @"Nahright.com"];
    [testList addObject: @"Pitchfork.com"];
    [testList addObject: @"Fader.com"];
    [testList addObject: @"Complex.com"];
    [testList addObject: @"Realtalkny.uproxx.com"];
    
    return testList;
}



@end
