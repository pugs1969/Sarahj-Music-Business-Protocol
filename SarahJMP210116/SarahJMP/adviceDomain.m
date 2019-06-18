//
//  adviceDomain.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-17.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "adviceDomain.h"

@implementation adviceDomain
@synthesize type;
@synthesize advice;

- (id)initWithName:(NSString *)typeName andAdvice:(NSString *)adviceStr
{
    self = [super init];
    if (self) {
        self.type = typeName;
        self.advice = adviceStr;
    }
    
    return self;
}


-(void) print
{
    NSLog(@"Type: %@\nAdvice: %@", self.type, self.advice);
}
@end
