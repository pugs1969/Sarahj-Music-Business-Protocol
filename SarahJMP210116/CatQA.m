//
//  CatQA.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-08-27.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CatQA.h"

@implementation CatQA
@synthesize cat;
@synthesize question;
@synthesize answer;

- (id)initWithName:(NSString *)catName andQuestion:(NSString *)ques andAnswer:(NSString *)ans
{
    self = [super init];
    if (self) {
        self.cat = catName;
        self.question = ques;
        self.answer = ans;
    }
    
    return self;
}

-(id)initWithName:(NSString *)blog
{
    self=[super init];
    if (self)
    {
        self.cat = blog;
    }
    return self;
}

-(void) print
{
    NSLog(@"Category: %@\nQuestion: %@\nAnswer: %@",cat,question,answer);
}
@end
