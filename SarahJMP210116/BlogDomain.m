//
//  BlogDomain.m
//  SarahJMP
//
//  Created by Lee Beatzz on 2015-09-29.
//
//

#import "BlogDomain.h"

@implementation BlogDomain


-(id) initWithName: (NSString *) blogName
{
    self = [super init];

    self.blogName = blogName;

    return self;
}

-(void) print
{
    NSLog(@"Blog name: %-31s",[self.blogName UTF8String]);
}

@end
