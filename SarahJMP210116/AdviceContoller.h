//
//  AdviceContoller.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-17.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "adviceDomain.h"

@interface AdviceContoller : NSObject
{
    NSString        *typeName;
    NSString        *adviceStr;
    NSMutableArray  *adviceList;
    NSMutableArray  *testList;
}

+(id)sharedManager;
-(void) addAdvice: (adviceDomain *) theAdvice;
-(int) enteries;
-(void) list;
-(NSMutableArray *) getArtistList;
-(NSMutableArray *) getProducerList;
-(void) testList;


@end
