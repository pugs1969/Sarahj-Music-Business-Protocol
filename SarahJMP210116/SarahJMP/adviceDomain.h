//
//  adviceDomain.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-17.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface adviceDomain : NSObject
{
    NSString *type;
    NSString *advice;
}

@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *advice;
-(id) initWithName:(NSString *)typeName andAdvice:(NSString*)adviceStr;
-(void) print;
@end
