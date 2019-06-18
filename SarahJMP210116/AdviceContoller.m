//
//  AdviceContoller.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-17.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AdviceContoller.h"
#import "adviceDomain.h"

@implementation AdviceContoller
static adviceDomain *mySharedManager = nil;

+(id)sharedManager
{
    @synchronized(self)
    {
        if(mySharedManager == nil)
            mySharedManager = [[self alloc] init];
    }
    return mySharedManager;
}

- (id) initWithName: (NSString *) name
{
    self = [super init];
    if (self)
    {
        typeName = [[NSString alloc ] initWithName: name ];
    }
    
    return self;
}

-(void) addAdvice:(adviceDomain *)theAdvice
{
    [adviceList addObject: theAdvice];
}

-(int) enteries
{
    return [adviceList count];
}

-(void) list
{
    NSLog(@"======= Contents of: Advice =======");
    /*
     for (Category *theCategory in categoryList)
     NSLog (@"%-20s", [theCategory.name UTF8String]);
     */
    NSLog (@"=======================================");
}

-(NSMutableArray *) getArtistList
{
    adviceList = [[NSMutableArray alloc] init ];
    
    [self testList];
    
    for (int i =0; i < [testList count]; i++)
    {
        NSString *item;
        item = [testList objectAtIndex: i];
        NSArray *testList = [item componentsSeparatedByString:@"|"];
        if ([[testList objectAtIndex: 0] isEqualToString:@"Artists"]) {
            adviceDomain *adviceItem = [[adviceDomain alloc] initWithName:[testList objectAtIndex: 0] andAdvice:[testList objectAtIndex:1]];            
            [adviceList addObject:adviceItem]; 
        }
    }   
    return adviceList;
}

-(NSMutableArray *) getProducerList
{
    adviceList = [[NSMutableArray alloc] init ];
    
    [self testList];
    
    for (int i =0; i < [testList count]; i++)
    {
        NSString *item;
        item = [testList objectAtIndex: i];
        NSArray *testList = [item componentsSeparatedByString:@"|"];
        if ([[testList objectAtIndex: 0] isEqualToString:@"Producers"]) {
            adviceDomain *adviceItem = [[adviceDomain alloc] initWithName:[testList objectAtIndex: 0] andAdvice:[testList objectAtIndex:1]];            
            [adviceList addObject:adviceItem]; 
        }
    }   
    return adviceList;
}

-(void) testList
{
    testList = [[NSMutableArray alloc] init];
    [testList removeAllObjects];
    [testList addObject:@"Artists|1) #Artists: The music business is not something you can learn from a book. It takes time and experience, networking and trying new strategies!"];
    [testList addObject:@"Artists|2) #Artists: Its a FULL TIME JOB!, if you really wanna make an impact on the music scene. How bad do you want it? Constantly record and get it out to the streets!"];
    [testList addObject:@"Artists|3) #Artists: Never look to the winners of the past, and old school ways of doing things to lead you towards the future of whats going on in music NOW!"];
    [testList addObject:@"Artists|4) #Artists: Where there is change in the music business, there is definitely opportunity! Don't get scared of what doesn't exist anymore."];
    [testList addObject:@"Artists|5) #Artists: If you say you have a label or a company, make sure you really have it...or you're really not ready to do real business..."];
    [testList addObject:@"Artists|6) #Artists: Do you have an idea of who your fans are? Who your promoting to? What regions and ages? Develop a REAL plan!"];
    [testList addObject:@"Artists|7) #Artists: If you haven't made it yet...maybe their is no demand for what you're pushing! We can judge your music all day, but the public has the final say!"];
    [testList addObject:@"Artists|8) #Artists: Proper planning is crucial! Build a team, budget, strategize, and create a REALISTIC marketing plan! Take your time!"];
    [testList addObject:@"Artists|9) #Artists: Everyone in your crew should earn their slot. Those not pulling their weight should be left behind."];
    [testList addObject:@"Artists|10) #Artists: You need a motivated team around you. The winners are working 24/7."];
    [testList addObject:@"Artists|11) #Artists: If your waiting for someone to cut you a cheque so you can stay at home and create, so they can sell your material, Then your missing the point! You need to get out in the streets and grind!"];
    [testList addObject:@"Artists|12) #Artists: You have to be innovative, and stay ahead of the curve. Don't complain, and no excuses."];
    [testList addObject:@"Artists|13) #Artists: If you want to sign with a major label, your best bet is to develop yourself! They are not taking any risks these days..."];
    [testList addObject:@"Artists|14) #Artists: If you can't draw a crowd, or generate some type of revenue...labels will not be interested."];
    [testList addObject:@"Artists|15) #Artists: Labels find Artists by doing their research on unsigned talent that has a buzz,they visit different websites to see who people are talking about."];
    [testList addObject:@"Artists|16) #Artists: Finding an artist who's original, who's done an abundant amount of shows and who has an audience...That's the winning combination the record companies look for!"];
    [testList addObject:@"Artists|17) #Artists: Yes you have talent. So does he, and she, and them and their cousins, uncles, best friends, nephew...What makes you different from the rest?"];
    [testList addObject:@"Artists|18) #Artists: If your music is that good!...The public will spread the word! If it doesn't happen, you need to go back to the drawing board!"];
    [testList addObject:@"Artists|19) #Artists(Singers): You are competing with the Beyonce's, Adele's, Gaga's, of the music age, and literally the music is at the consumers fingertips...your music must be just as good or even better."];
    [testList addObject:@"Artists|20) #Artists: You have to sell a true story...An authentic movement! What separates you from all the other Artists making waves...?"];
    [testList addObject:@"Artists|21) #Artists: You have to convince the public you are real...Everybody loves a catchy song, but what do you offer to have longevity in the industry?"];
    [testList addObject:@"Artists|22) #Artists: Stop spending countless hours trying to get the attention of a select few people. Find a way to do it yourself and broaden your horizons."];
    [testList addObject:@"Artists|23) #Artists: Stop waiting for someone's permission to be an artist...a producer...a songwriter...an entrepreneur, a visionary, a legend!"];
    [testList addObject:@"Artists|24) #Artists: The music business is divided into 2 groups... leaders and followers, which one are you?"];
    [testList addObject:@"Artists|25) #Artists: Focus on yourself, people, and situations that will help your career GROW! Being great comes from listening and experience."];
    [testList addObject:@"Artists|26) #Artists: In order to \"make it\" in the music industry, you have to have ideas as an artist and as a business person! The industry does not tolerate ignorance. Be informed and take responsibility for your future in all aspects."];
    [testList addObject:@"Artists|27) #Artists: Always have plan A, B, C,and D. The music business is constantly evolving, changing and growing due to many factors, especially due to technology. Stay informed or you may become obsolete!"];
    [testList addObject:@"Artists|28) #Artists: You can be completely independent and still get paid...which was almost impossible to do before the Internet and iTunes era..."];
    [testList addObject:@"Artists|29) #Artists: Do you have enough evidence that can prove your music will work? DJ response, online movement circulation, mixtapes, videos, Radio/Club spins."];
    [testList addObject:@"Artists|30) #Artists: Now you can get the responses from all the DJs, blogs, and internet to see if your music is working. Having enough evidence to prove is KEY!"];
        
    [testList addObject:@"Producers|1) #Producers: The music business is not something you can learn in a book, you learn over a period of time, by networking and trying new strategies!"];
    [testList addObject:@"Producers|2) #Producers: Practice is very important, perfect your craft, being really great on the keys or guitar will go a long way on tracks."];
    [testList addObject:@"Producers|3) #Producers: Master your craft! You can't win in this industry if you don't fully understand it. Don't just expect to become successful."];
    [testList addObject:@"Producers|4) #Producers: If you pushed this far, don't give up! Your success is ahead of you."];
    [testList addObject:@"Producers|5) #Producers: Shopping your music is all subjective. Get as close to the source (artist) as possible. They have more placement power than record executives."];
    [testList addObject:@"Producers|6) #Producers: There are mixtape records out there that are getting heavy rotation, just like records coming off retail. Use it to get your name out there!"];
    [testList addObject:@"Producers|7) #Producers: Its crazy to me that some of you demand BIG placements but can't spend money to market yourself, or travel to consult with experienced people in the industry...HARD WORK=BIG PAY OUTS!"];
    [testList addObject:@"Producers|8) #Producers: You may get lucky with overnight success, but it usually disappears as quickly as it came. Create for longevity."];
    [testList addObject:@"Producers|9) #Producers: \"NO I.D\"(producer) put many years into his music, going back to Chi-town & Common days, before he ended up at Def Jam."];
    [testList addObject:@"Producers|10) #Producers: Stop telling people you have \"hot beats\" and \"hits for days!\" Your beats/production need to speak for themselves. The \"talk\" comes across as unprofessional and inexperienced."];
    [testList addObject:@"Producers|11) #Producers: There's a fine line between following up and being pushy...You will know if a record sticks."];
    [testList addObject:@"Producers|12) #Producers: Most executives/artists know in the first 10 seconds if a track feels good or not...Put your best work forward!"];
    [testList addObject:@"Producers|13) #Producers: Are your tracks mixed? Do they have bridges? Breaks? Structure? Formatted? Ready for an artist to jump on?"];
    [testList addObject:@"Producers|14) #Producers: You can do the blind emails with your music, but that shouldn't be your ONLY move to get your beats out."];
    [testList addObject:@"Producers|15) #Producers: Most producers that get famous, either come up with a new artist (40/Boi-1da/T-Minus, all with Drake), Or they were pushing their music using the internet."];
    [testList addObject:@"Producers|16) #Producers: You actually have to market yourself just like an artist these days. Get a logo made,business cards,get on producer websites."];
    [testList addObject:@"Producers|17) #Producers: Work on those melodies! Your production has to sound bright and pop out, which will make artists want to record to your track!"];
    [testList addObject:@"Producers|18) #Producers: You have to always be your worst critic!"];
    [testList addObject:@"Producers|19) #Producers: You need to get into artist development mode and fill the void left by the labels. Its no coincidence that producer \"NO I.D.\" is working for Def Jam now."];
    [testList addObject:@"Producers|20) #Producers: If your sending out fully referenced records to professionals, make sure your singers vocals are on point! Its a reflection of your work."];
    [testList addObject:@"Producers|21) #Producer: Break throughs are happening constantly. That doesn't mean your ready, but when you are, you will see the doors open up for you."];
    [testList addObject:@"Producers|22) #Producers: You better be knowledgeable on official songwriting credits or you will be giving away publishing royalties."];
    [testList addObject:@"Producers|23) #Producers: The \"real\" consistent money as a Writer/Producer (that you can depend on) is your ASCAP/BMI performance rights, which is why your publishing knowledge should be on point!"];
    [testList addObject:@"Producers|24) #Producers: Some Producers put too many tags running through their beats. If you want an artist to get on your beats, put a tag in the intro and that's it!"];
    [testList addObject:@"Producers|25) #Producers: Use making great music as a springboard into other source of money flow."];
    [testList addObject:@"Producers|26) #Producers: With less money in the music business, only the true Producers persevere, because they're not in it only for the money but for the love!"];
    [testList addObject:@"Producers|27) #Producers: Follow these 3 steps and you'll never go wrong: \n1) Make a beat. \n2) Mix the beat. \n3) Copyright the beat."];
    }

@end
