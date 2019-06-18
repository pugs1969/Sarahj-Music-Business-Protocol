//
//  CatQAController.h
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-09.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatQA.h"

@interface CatQAController : NSObject
{
    NSString        *catQAName;
    NSString        *catQAQuestion;
    NSString        *catQAAnswer;
    NSMutableArray  *catQAList;
}


-(void) addCatQA: (CatQA *) theCatQA;
-(int) enteries;
-(void) list;
+(id)sharedManager;
-(NSMutableArray *) getList: (NSInteger) category;
-(NSMutableArray *) all;
-(NSMutableArray *) publishing;
-(NSMutableArray *) royalty;
-(NSMutableArray *) promotion;
-(NSMutableArray *) production;
-(NSMutableArray *) legal;
-(NSMutableArray *) submission1;
-(NSMutableArray *) submission2;
-(NSMutableArray *) submission3;
-(NSMutableArray *) booking;
@end
