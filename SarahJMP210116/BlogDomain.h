//
//  BlogDomain.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-17.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogDomain : NSObject
@property (nonatomic, strong) NSString * blogName;

-(id) initWithName:(NSString *) blogName;
-(void) print;
@end
