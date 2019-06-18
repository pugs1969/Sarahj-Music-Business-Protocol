//
//  CatQA.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-08-27.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatQA : NSObject
{
    NSString *cat;
    NSString *question;
    NSString *answer;
}

@property (copy, nonatomic) NSString *cat;
@property (copy, nonatomic) NSString *question;
@property (copy, nonatomic) NSString *answer;

-(id) initWithName:(NSString *)category andQuestion:(NSString*)ques andAnswer:(NSString*)ans;
-(id) initWithName:(NSString *)blog;
-(void) print;

@end
