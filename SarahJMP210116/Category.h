//
//  Category.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-07-08.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Category : NSObject
{
    NSString *name;
}

@property (copy, nonatomic) NSString *name;

-(id) initWithName:(NSString *) categoryName;
-(void) print;

@end
