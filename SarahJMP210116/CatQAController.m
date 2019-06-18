//
//  CatQAController.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-09-09.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CatQAController.h"

@implementation CatQAController
static CatQAController *mySharedManager = nil;

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
        catQAName = [[NSString alloc ] initWithName: name ];
    }
    
    return self;
}

-(void) addCatQA:(CatQA *)theCatQA
{
    [catQAList addObject: theCatQA];
}

-(int) enteries
{
    return [catQAList count];
}

-(void) list
{
    NSLog(@"======= Contents of: %@ =======", catQAName);
    /*
    for (Category *theCategory in categoryList)
        NSLog (@"%-20s", [theCategory.name UTF8String]);
    */
    NSLog (@"=======================================");
}

-(NSMutableArray *) getList: (NSInteger) category
{
        catQAList = [[NSMutableArray alloc] init ];
        NSMutableArray *delimList = [[NSMutableArray alloc] init];
        
        switch (category) 
        {
            case 0:
                delimList = self.publishing;
                break;
            case 1:
                delimList = self.royalty;
                break;
            case 2:
                delimList = self.promotion;
                break;
            case 3:
                delimList = self.blog;
                break;
            case 4:
                delimList = self.legal;
                break;
            case 5:
                delimList = self.production;
                break;
            case 6:
                delimList = self.submission1;
                break;
            case 7:
                delimList = self.submission2;
                break;
            case 8:
                delimList = self.submission3;
                break;
            case 9:
                delimList = self.booking;
                break;
            case 10:
                delimList = self.all;
                break;
        }
    
    
        for (int i =0; i < [delimList count]; i++)
        {
            
            NSString *item;
            item = [delimList objectAtIndex: i];
            CatQA *catQA;
            if (category ==3)
            {
                catQA = [[CatQA alloc] initWithName: item];
            }
            else
            {
                NSArray *QAList = [item componentsSeparatedByString:@"|"];
            
                catQA = [[CatQA alloc] initWithName:[QAList objectAtIndex: 0] andQuestion:[QAList objectAtIndex:1] andAnswer:[QAList objectAtIndex:2]];
            }
            
            [catQAList addObject:catQA];
        }
    return catQAList;
    
}

-(NSMutableArray *) all
{
    NSMutableArray *QAList = [[NSMutableArray alloc] init];
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    QAList = self.publishing;
    temp = self.royalty;
    for(NSString *item in temp)
    {
        [QAList addObject:item];
    }
    
    temp = self.promotion;
    for(NSString *item in temp)
    {
        [QAList addObject:item];
    }
    
    temp = self.legal;
    for(NSString *item in temp)
    {
        [QAList addObject:item];
    }
    
    temp = self.production;
    for(NSString *item in temp)
    {
        [QAList addObject:item];
    }
    
    temp = self.submission1;
    for(NSString *item in temp)
    {
        [QAList addObject:item];
    }
   
    temp = self.submission2;
    for(NSString *item in temp)
    {
        [QAList addObject:item];
    }
    
    temp = self.submission3;
    for(NSString *item in temp)
    {
        [QAList addObject:item];
    }
        
    temp = self.booking;
    for(NSString *item in temp)
    {
        [QAList addObject:item];
    }
      
    return QAList;
}


-(NSMutableArray *) publishing
{
    NSMutableArray *QAList = [[NSMutableArray alloc] init];

    [QAList addObject:@"Publishing|1) What's the difference between publishing and royalties?|SJ: Royalties are profits from units sold, and publishing is the percentage of each time the record is played."];
    [QAList addObject:@"Publishing|2) How much publishing percentage am I entitled to as a producer/songwriter/artist?|SJ: Songwriter=50%(If He/She pens the full song)\n\nProducer=50% (If He/She composed the full beat)\n\nArtist=Will negotiate with the Record Company"];
     [QAList addObject:@"Publishing|3) Is it better to give up my publishing rights and take an upfront fee for my production/song?|SJ: NO!NO!NO! I see so many talented producers sabotage themselves from getting really good placements because they get caught up with demanding an upfront fee. Upfront fees are right now money that comes and goes. Publishing cheques could potentially last a lifetime, or last a lot longer than an upfront fee. So! If you're up and coming, don't get caught up in asking for an upfront fee, worry about getting a great publishing percentage. When you become a \"go to\" producer, then you can go ahead and ask for an upfront fee. "];
     [QAList addObject:@"Publishing|4) What's the benefits of getting a major publishing deal as a Producer/Songwriter/Artist?|SJ: Getting first submission opportunities to major artists who are looking for new material for whatever project they may be working on; opportunities in scoring a major film, or composing music for movie soundtracks."];
     [QAList addObject:@"Publishing|5) What are some of the major publishing companies in the music business?|SJ: Cherry Lane, Hitco, Bad Boy Publishing, Roc Nation Publishing, EMI, etc..."];
     [QAList addObject:@"Publishing|6) How does one land a music publishing deal with a major music publishing company?|SJ: Well, having a popular song on the radio can land a publishing deal or getting multiple major placements."];
     [QAList addObject:@"Publishing|7) When a publishing company offers you an \"advance\", what does that mean?|SJ: You are given a certain amount of money that needs to be recouped in record sales.  The purpose of this advance is to financially get your project up and going. But again, this is money that needs to be recouped in sales."];
     [QAList addObject:@"Publishing|8) What are the different publishing deals a major publishing company may offer?|SJ: The various deals are Administration, Sub-Publishing, Single Song Assignment, Exclusive Publishing, and a Co-Publishing Deal."];
     [QAList addObject:@"Publishing|9) What is a co-publishing deal?|SJ: When your publishing company gets a deal with another publishing company, and one agrees to pay the other 50% (or whatever is negotiated) of a publishing share."];
     [QAList addObject:@"Publishing|10) How is a music publishing company created?|SJ: You will have to have a registered business with a business/tax I.D. "];
     [QAList addObject:@"Publishing|11) What are the pros and cons of having your own music publishing company?|SJ: The Con: lots of paper work\n\nThe Pro: you collect and pay yourself publishing."];
     [QAList addObject:@"Publishing|12) What's a split sheet?|SJ: Percentages broken down to establish who gets what share/percentage of Royalties or Publishing."];
     [QAList addObject:@"Publishing|13) At what point will I need a split sheet?|SJ: A split sheet, as the name suggests, is an agreement as to how to divide the royalties/publishing when you write a song that will potentially generate royalties/publishing."];
     [QAList addObject:@"Publishing|14) What is a performance rights society?|SJ: A collection society that monitors and collects music royalties for recording artists, composers and songwriters."];
     [QAList addObject:@"Publishing|15) At what point should I register my beats/songs with a performing rights society?|SJ: When it gets placed, and you are told the name of the song by the artist or the record company. Don't register the beat with the name you first called it when composed, because the artist may name it something else, then you'll be screwed; always check with the artist first for the title of the song he/she wrote to your beat."];
     [QAList addObject:@"Publishing|16) What are the different performing rights societies in the music industry?|SJ: ASCAP, BMI, SESAC, SOCAN (Canadian PRS)."];
     [QAList addObject:@"Publishing|17) What’s the difference between ASCAP, BMI, SESAC & SOCAN?|SJ: Not much difference, they all do the same thing, which is collect royalties. "];
     [QAList addObject:@"Publishing|18) Who pays more, SESAC, ASCAP, BMI, or SOCAN?|SJ: It's a myth, none pays more than the other."];
     [QAList addObject:@"Publishing|19) How does a performing rights society track your work?|SJ: It's tracked through PPL(Phonographic Performance Limited).  PPL licenses hundreds of TV and radio stations, and they monitor how many plays the records get from whomever licenses the records."];

    return QAList;
}

-(NSMutableArray *) royalty
{
    NSMutableArray *QAList = [[NSMutableArray alloc] init];
    
    [QAList addObject: @"Royalty|1) What are royalties?|SJ: Points percentages off records/units sold."];
    [QAList addObject: @"Royalty|2) What are the different forms of royalties one can receive as a producer/songwriter/artist?|SJ: It depends on what role you play in the composition of the music. But for the most part, there are 3 forms of Royalties you can receive, Mechanical Royalties, Digital/Internet Royalties, and Performance Royalties(live performances at shows,performance on tv,radio etc..)"];
    [QAList addObject: @"Royalty|3) Who pays out royalties?|SJ: A publishing company, whether your own, or one with whom you have a signed contract.  PRS(Performing rights society) can also collect your royalties if you are registered with one(ASCAP, BMI, SESAC, SOCAN)."];
    [QAList addObject: @"Royalty|4) Who tracks and collects one's royalties?|SJ: Publishing companies and PRS(Performing Rights societies) do all the necessary leg work, phone work, and emailing, in order to collect your royalties. And again, you have to be registered to a PRS or signed to a publishing company. "];
    [QAList addObject: @"Royalty|5) Do most new songwriters/producers/artists get to choose what royalty percentage they get when signed to a major record company?|SJ: No, 3% is the standard rate right now, that new songwriters, producers, and artists get...having a good lawyer can possibly get you 6%, but not always. Once you've proven yourself as a hit maker(moneymaker), then you can negotiate a percentage in royalties, but for now...It is what it is."];
    [QAList addObject: @"Royalty|6) Do we need record companies to determine what percentage one gets in royalties given the new digital era?|SJ: No. If your online presence is up as well as your buzz, and your material is being circulated through out night clubs, then at that point you already have a fan base that you're bringing to the table, so if a major record company approaches you about a deal, then you can negotiate what royalty percentage you want, not what they want to give you."];
    [QAList addObject: @"Royalty|7) At what point would/should a producer who is getting a major beat/production placement start getting royalties?|SJ: Depends if your beat placement lands on an album or becomes a single, and how many units the album or the single sells."];
    [QAList addObject: @"Royalty|8) With an album/mixtape released as a recording artist, at what point would/should I be entitled to royalties?|SJ: Well first off, it depends on what deal you agreed to with other parties. But for the most part, the rules still apply, as question #7: Depends on how many units your album/mixtape sells, or the single off the project sell. So put it out, and hope for the best!"];
    [QAList addObject: @"Royalty|9) As a songwriter getting major placements, at what point would/should I start getting royalties?|SJ: Same rules/answers apply as question # 7 and 8."];
    [QAList addObject: @"Royalty|10) When a recording artist agrees to sign a 360 deal with a record company, what does that mean?|SJ: Well before we go over what a 360 deal is, you must first have knowledge and understanding on what record companies requested or were only entitled to in payment in the past. Record companies required payment based on whatever units were sold from whatever album projects worldwide, LP's, Soundtracks, Music video rotations, radio spin rotations,commercials. That's it! Artists would earn money from road tours, stage shows, endorsement deals(sneakers, make-up, alcohol, etc…) Without record companies having their hands out. Now with 360 deals, record companies want it all!"];
    [QAList addObject: @"Royalty|11) If I get a beat/song placement with tv and/or film, should I expect royalties when my beat/song is played?|SJ: Yes! But these days, film and tv are buying music material outright, meaning just giving you a hefty upfront fee, and in return they ask for full rights to the beat or song. Now it varies if TV/Film will work out any royalty payments, it depends on your influence, who you know, and of course your past/current credentials; so If you're a nobody just getting a placement, they'll just offer you an upfront fee.  "];
    [QAList addObject: @"Royalty|12) When DJ's spin recording artists songs in Night Clubs, are those recording artists entitled to royalty payments?|SJ: Technically, yes, but are royalties ever collected? No. Why? Because Performing Rights Societies haven't fully figured out a strict way to monitor the amount of spins of each record being played/spinned in a night club."];
    [QAList addObject: @"Royalty|13) Can mixtapes generate royalties? And how?|SJ: Yes! If its for sale, and depends on how many people buy it, or if a single off the mixtape gets any radio spins, including satellite radio. But before you see any of that, you have to make sure you register your beat/song with your performing rights society."];
    [QAList addObject: @"Royalty|14) If I produce a beat that lands on a mixtape, can that generate royalties for a producer? And how?|SJ:Yes! There are a few ways you can generate royalties with a mixtape release.  If the beat you produced/composed gets satellite radio play or regular radio play, if you worked out an agreement with the artist to get points on every sale of the mixtape(which generally rarely happens), or if the record gets licensed by TV/Film.  "];
    [QAList addObject: @"Royalty|15) If I do a jingle, can I expect to receive royalties when my Jingle airs on radio and/or tv?|SJ: Technically yes! But again, it depends on the agreement worked out by you and the other party, if you're inexperienced, then expect an outright purchase offer.  If you're a Producer with credibility, then a royalty percentage can be negotiated."];
    [QAList addObject: @"Royalty|16) If I sign a contract with a independent record company, can I expect to see any royalties?|SJ: Yes! If any records are released that is. And you can probably expect more than a 3% royalty share as well."];
    [QAList addObject: @"Royalty|17) As an independent artist, how can I sell my music on iTunes to generate royalties for myself?|SJ: By first copyrighting your music, then registering your music with a performing rights society(ASCAP,BMI,SESAC,SOCAN), and finally registering your music with iTunes. If you go to apple.com/ca, there should be instructions on how to do it. To generate sales/royalties...you promote the heck out of the record(build a fan base)."];
    [QAList addObject: @"Royalty|18) As a producer, if I sample a record, can I expect to receive royalties from that record?|SJ: If you get clearance on the sample from the original copyright owner, and you work out an agreement with him/her to get a percentage of the royalties. Copyright owners are never always that generous.  One thing I would suggest is never sample a well known record without getting clearance before its releasing. That could be a financial death trap for your career. The sample police are watching and listening, and are very sneaky.  They will wait until your sampled record gets to it's peak of sales, then they'll come knocking!"];
    [QAList addObject: @"Royalty|19) Should a manager ask for a portion of my royalties as part payment and is that protocol?|SJ: No! Giving your manager a percentage of your royalties is not protocol! That would be a personal preference, or if you think it would be in your best interest."];
    [QAList addObject: @"Royalty|20) Should an Entertainment Lawyer ask for a portion of my royalties as part payment and is that Protocol?|SJ: No! But if you feel it will be in your best interest, then feel free to do so."];
    return QAList;
}

-(NSMutableArray *) promotion
{
    NSMutableArray *QAList = [[NSMutableArray alloc] init];
    [QAList addObject: @"Promotion|1) As an Independent Artist, how can I promote myself to gain public recognition to my talent?|SJ: I suggest using online sites such as, Soundclick(soundclick.com), Reverb Nation(reverbnation.com) and Sound Cloud(soundcloud.com). Tie that in with your social media accounts and post your audio to your followers or potential followers. Also create a Youtube channel(youtube.com) and post as much quality footage of yourself as possible."];
    [QAList addObject: @"Promotion|2) As a Producer, how can I promote my beats/production to attract the attention of major record companies/Artists?|SJ: Create an account on a premier Producer website, such as \"PMPworldwide.com\". I'm the corporate account manager for PMPWorldWide.com, so I would be more than happy to set up any up and coming producer with an account. The account allows you full access to all the major artist track submissions.  Participate in some of the beat battles in and out of your city to spread your sound, and network with potential clients. Mixtapes are also another platform for producers to showcase their beats."];
    [QAList addObject: @"Promotion|3) As a Songwriter, how can I promote my songwriting abilities to attract the attention of a major publishing company or a major recording artist?|SJ: Writers Block on PMPWorldWide.com, Soundcloud.com, put your song references on there. Attend different BMI/ASCAP/SOCAN writers workshops."];
    [QAList addObject: @"Promotion|4) Which gives you the best & fastest results, Internet promotion, or street promotion?|SJ: Definitely Internet. You're reaching more people faster as well as internationally.  However, both promotional strategies go hand in hand.  Its important to get out into the streets to different networking events, album release parties, etc. to promote your material. It is also good to have a promotional street team. As well as an online marketing team."];
    [QAList addObject: @"Promotion|5) Is spamming a great way to make my music/youtube video go viral?|SJ: No, it is not an effective marketing strategy to spam record executives all day, everyday. We don't click on the links unless it has been recommended to us from a reputable source. You want to create a big enough internet buzz so that when we do our internet research, we will just stumble upon you and your material. "];
    [QAList addObject: @"Promotion|6) Being a Producer/songwriter/Artist, what are some of the websites I can use to promote my music?|SJ: Soundcloud(soundcloud.com), Reverb Nation(reverbnation.com), PMPWorld(PMPworldwide.com) , YouTube(youtube.com), Ustream(ustream.tv)."];
    [QAList addObject: @"Promotion|7) Is handing out free promotional CDs outside of a night club, still an effective way to promote myself as a producer/artist?|SJ: No. You probably will not get any real results. The CDs end up on the ground or in the toilet. Get T-shirts made up with your artist/producer's name on it, along with a URL link with your material that people can checkout online. No one turns down free clothes so have a flash drive containing your music to give out along with the T-Shirts."];
    [QAList addObject: @"Promotion|8) As a artist, how can a mixtape help promote my music?|SJ: Mixtapes are great promo for up and coming/established artists. It allows DJs and the public to judge and decide what records are hot to them. Mixtapes are low over head, easy to promote, and a great way to get your sound out to the world. "];
    [QAList addObject: @"Promotion|9) As a Producer, how can a mixtape help promote my beats/Production?|SJ: A lot of artists and A&Rs find new producers through mixtapes. They will reach out to you if they like and hear your sound enough.  Demand that your tag stays at the beginning of your track for self branding and promotion...I recommend not tagging the full beat. "];
    [QAList addObject: @"Promotion|10) How does an up and coming Producer, artist, or songwriter get his/her music material on a well known mixtape?|SJ: You have to keep submitting music to these artists/A&Rs/mixtape DJ's, until something sticks."];
    [QAList addObject: @"Promotion|11) Do record executives pay attention to mixtapes?|SJ: Yes, only if its properly marketed. Good visuals, cool artwork, credible Artists/DJ on the mixtape."];
    [QAList addObject: @"Promotion|12) As a singer, is my image important to promote, or should I just try to promote my voice only?|SJ: Both. If you're marketable, it helps to have photos of yourself on the cover artwork. Make sure your vocals sound excellent. Make your chorus sound big and bright. "];
    [QAList addObject: @"Promotion|13) What does the term \"Going Viral\" mean?|SJ: It means becoming extremely popular in a very short amount of time."];
    [QAList addObject: @"Promotion|14) What do record executives look for when viewing a YouTube video?|SJ: Record executives look for great visual quality, info on where to find you, public comments, number of youtube views, credits."];
    [QAList addObject: @"Promotion|15) What are E-blasts Promotions?|SJ: E-Blasts are huge email lists combined to reach a huge entertainment audience or record executives through email. I recommend using Fan Bridge(fanbridge.com) or the Wondertwinz(wondertwinz.com) for this."];
    [QAList addObject: @"Promotion|16) How effective are E-Blasts when promoting music?|SJ: E-blasts work if they are being blasted from a reputable company. Best time to do one is Monday mornings when everyone is online, checking emails. You can target certain groups such as execs, labels, indy artists, djs, etc..."];
    [QAList addObject: @"Promotion|17) Wouldn't E-Blasts be considered spamming?|SJ: E-blasts are somewhat spamming, especially if its coming from a unsolicited person, but a company with credibility will not be not be overlooked."];
    [QAList addObject: @"Promotion|18) In order to get a strong fan base, whether a producer, artist, or songwriter, how long do you think a promotional campaign should run?|SJ: At least 2-6 months minimum. Consistency is key. If you run an ad 5-10 times a week, the receiving end will be more motivated to download or check out the material based on curiosity alone.  One email blast is not going to be enough. "];
    [QAList addObject: @"Promotion|19) With so many advertising companies out there, how can one know what company will provide me with the best results?|SJ: Make sure you get in writing what it is these advertising companies are offering you, for whatever the amount they charge.  See how far or how much of a demographic or audience the companies reaches, and determine how long the advertising will run. "];
    [QAList addObject: @"Promotion|20)  What are some effective advertising companies with reasonable prices for the independent artist, Producers, or songwriter?|SJ:Coast 2 Coast Mixtapes(coast2coastmixtapes.com), Datpiff(datpiff.com), Mp3 Waxx(mp3waxx.com), and Wondertwinz(wondertwinz.com)."];
    
    return QAList;
}

-(NSMutableArray *) blog
{
    NSMutableArray *blogList = [[NSMutableArray alloc] init];
    
    [blogList addObject: @"Key Blogs you should familiarize yourself with end potentially seek the attention of:"];
    [blogList addObject: @"Rapradar.com"];
    [blogList addObject: @"Inflexwetrust.com"];
    [blogList addObject: @"Globalgrind.com"];
    [blogList addObject: @"2dopeboyz.com"];
    [blogList addObject: @"Rap-up.com"];
    [blogList addObject: @"Youheardthatnew.com"];
    [blogList addObject: @"Hotnewhiphop.com"];
    [blogList addObject: @"Rapgenius.com"];
    [blogList addObject: @"Hiphopowired.com"];
    [blogList addObject: @"Vladtv.com"];
    [blogList addObject: @"Worldstarthiphop.com"];
    [blogList addObject: @"Djbooth.net"];
    [blogList addObject: @"Sohn.com"];
    [blogList addObject: @"Hiphopdx.com"];
    [blogList addObject: @"Allhiphop.com"];
    [blogList addObject: @"Nahright.com"];
    [blogList addObject: @"Pitchfork.com"];
    [blogList addObject: @"Fader.com"];
    [blogList addObject: @"Complex.com"];
    [blogList addObject: @"Realtalkny.uproxx.com"];

    return blogList;
}


-(NSMutableArray *) legal
{
    NSMutableArray *QAList = [[NSMutableArray alloc] init];
    
    [QAList addObject: @"Legal Advice|1) What does Copyright mean?|SJ: It quite simply means that the original author or creator of any creative work (writing, images, music, software, etc.) has the sole right to copy (distribute, publish, sell, copy) that work for a set period of time, unless he or she explicitly hands over that right to someone else."];
    [QAList addObject: @"Legal Advice|2) What is the most simple and cost effective way to legally copyright songs/beats/lyrics without a lawyer?|SJ: In the USA (Canada below)\nProducers should fill out a SR form and send it along with a copy of the music and $35.00 to:\n\nThe Library of Congress\nCopyright Office\n101 Independence Ave, S.E\nWashington, D.C 20559-6000\n\nBelow is an SR Form\nSR Form (copyright) www.copyright.gov/forms/formsr.pdf\n\nAlternatively, you can electronically register/copyright your material.  Log on to www.copyright.gov for more info.\n\nIn Canada\nCanadian Producers/Artist/Songwriters, please refer to www.cb-cda.gc.ca for copyright information."];
    [QAList addObject: @"Legal Advice|3) What is the \"Poor Mans\" copyright?|SJ: The \"Poor Mans\" copyright is when you create a composition and then mail it to yourself with the envelope date stamped by the post office.   This attempts to prove that you have possessed the composition from a specific date.  However, if challenged, this will not hold up in court and is not a legitimate or recommended way to copyright your material."];
    [QAList addObject: @"Legal Advice|4) If I copyright songs/beats/lyrics in the United States, will it be protected all over the world or just in the United States?|SJ: Only in the United States."];
    [QAList addObject: @"Legal Advice|5) How do I protect my songs/beats/lyrics all over the world?|SJ: By copyrighting it in each country, all over the world.  Each country has different copyright laws."];
    [QAList addObject: @"Legal Advice|6) What will happen if I don't copyright my songs/beats/lyrics?|SJ: Your music may be stolen and used with no credit or royalties issued to you."];
    [QAList addObject: @"Legal Advice|7) What is a license agreement for songs/beats/lyrics?|SJ: When you give permission for your songs/beats/lyrics to be used commercially. "];
    [QAList addObject: @"Legal Advice|8) What does it mean to have or give exclusive rights to songs/beats/lyrics?|SJ: Giving exclusive rights to a song or beat means that the purchaser now has full control of the music.  They agree to the terms and pay for full rights to that particular piece of music.  Non-exclusive means that at any time if the music becomes of interest to another artist and/or label it can be sold, the purchaser does not own it.  Make sure your contracts are very clear to whether the music is for exclusive or non-exclusive purposes."];
    [QAList addObject: @"Legal Advice|9) How do I obtain authorization to sample a record?|SJ: Typically, the record company takes care of obtaining clearance for sampled records."];
    [QAList addObject: @"Legal Advice|10) If you sample a record without getting permission from the original copyright's owner, what will happen?|SJ: You may get sued for copyright infringement.  The Sample Police are always listening...Always!"];
    [QAList addObject: @"Legal Advice|11) What does it mean to own your masters/publishing?|SJ: To own the rights to your music."];
    [QAList addObject: @"Legal Advice|12) Under what terms would a lawyer accept payment on a back end deal?|SJ: When they are interested in your material and/or a deal is presented that can potentially make money."];
    [QAList addObject: @"Legal Advice|13) At what point in my music career would I need a lawyer?|SJ: When receiving contracts from record companies, publishing companies and during contract negotiations."];
    [QAList addObject: @"Legal Advice|14) What is the benefit of having a Entertainment Lawyer?|SJ: The benefits are, the lawyer will work to ensure your music and creativity are protected, works for your best interests within the music industry and helps you to navigate through the legal and formal proceedings within the music industry."];
    [QAList addObject: @"Legal Advice|15) Do I need a lawyer to copyright my songs/beats/lyrics?|SJ: No."];
    [QAList addObject: @"Legal Advice|16) How can I find a good Entertainment Lawyer?|SJ: Being referred from a credible source or through your own reference checks. "];
    [QAList addObject: @"Legal Advice|17) What are things to look for when trying to find a Entertainment Lawyer?|SJ: Credibility within the industry, his/her past clientele and work ethic."];
     [QAList addObject: @"Legal Advice|18) If I sign a contract with a record company in the United States, would the contract legally hold up in another country if challenged?|SJ: Depends on the details of the contract.  For example, if the contract states that \"You are only allowed to____ in the United States\" then the rights of the contract will be enforced if breached in the United States."];    

    return QAList;
}

-(NSMutableArray *) production
{
    NSMutableArray *QAList = [[NSMutableArray alloc] init];
    [QAList addObject: @"Production|1) What is the standard format for a Hip Hop beat?|SJ: The standard format for a Hip Hop beat is a verse, hook, verse, hook, outro. Each verse section should have a 16 bar count and each hook (chorus) should have a 8 bar count. Your outro should also be an 8 bar count."];
    [QAList addObject: @"Production|2) What is the standard format for an R&B beat?|SJ: The standard format for a R&B beat is an intro, verse, hook, verse, hook, bridge, outro. The intro should be a 4 or 8 bar count, the verse section should have a 16 bar count, the hook (chorus), the bridge, and the outro should all have an 8 bar count."];
    [QAList addObject: @"Production|3) What is the standard format for a Dance beat?|SJ: Dance beats are more flexible and can vary. The beat can range from an 8 or 16 bar chorus and at times a 12 bar verse. Aim for simplicity and stay away from overwhelming sounds as it makes it more difficult for a songwriter to pen to it."];
    [QAList addObject: @"Production|4) How long should a intro be in a beat/song?|SJ: An intro should be no longer than 20-30 seconds (8 bars)."];
    [QAList addObject: @"Production|5) How long should an outro be in a beat/song?|SJ: No longer than 20-30 seconds (8 bars)."];
    [QAList addObject: @"Production|6) What does referencing a song/chorus mean?|SJ: To record a vocal concept that paints a picture for a song. Referencing a song helps give an A&R/record company and/or artist a vocal image of the direction of the song that you are pitching to them."];
    [QAList addObject: @"Production|7) What should be the standard format for a referenced Hip Hop record?|SJ: The standard format for a referenced Hip Hop record is a verse, hook, verse, hook, outro. Each verse section should have a 16 bar count and each hook (chorus) should have an 8 bar count. Your outro should also be an 8 bar count with the chorus sections containing recorded vocals."];
    [QAList addObject: @"Production|8) What should be the standard format for a referenced R&B or dance record?|SJ: Recorded vocals to an 8 or 16 bar hook/chorus, a 12 or 16 bar verse for each verse section, and an 8 or 16 bar bridge."];
    [QAList addObject: @"Production|9) What's considered the \"bridge\" section in a beat/song?|SJ: The bridge section is like the climax of the record, before the outro section. The bridge may come in after the final hook/chorus."];
    [QAList addObject: @"Production|10) As a producer, should I always incorporate a bridge in my beats?|SJ: R&B records, yes. Hip Hop records don't necessarily need a bridge, but different transitions in the music/beat is needed to establish a beginning, middle, and end of a beat."];
    [QAList addObject: @"Production|11) If you're an up and coming producer, is copying an established producer's style of production a good or bad idea?|SJ: Bad idea. It's cool to be inspired by other producers in the industry, but put your own flavor to your production and establish your own sound identity. If you strive to bring your new sound into the music industry you will likely have more success."];
    [QAList addObject: @"Production|12) Does it matter if I use more samples in my production, than original sound/music?|SJ: Thats a personal choice. Beats on mixtapes do not require any form of sample clearance, but if you're striving for major placements, then yes, an original sound would be best. Keep in mind, if your going to use a sample, be sure to chop it up so it's not as identifiable, limit the portion you want to sample, or get clearance to use the sample."];
    [QAList addObject: @"Production|13) Being an up and coming producer, should I always have my beat/song professionally mixed/mastered?|SJ: That's a personal choice. Some producers are also engineers who can mix/master their own material. Some producers are not and decide to spend the money to professionally mix/master their beat/song. The important factor here is to always submit a quality and professional sounding track. Quality stands out, so how you achieve this level of quality is up to you. That being said, I still listen to everything as you may just find that \"diamond in the rough\"."];
    [QAList addObject: @"Production|14) Will Record Executives/Managers/Artists overlook distortion in beats/songs if it could be a potential hit record?|SJ: No! If the quality isn't there and it's distorted, they will just skip over it. Bad quality submissions may/can hurt your credibility for any future submission opportunities."];
    [QAList addObject: @"Production|15) What software do you recommend for producers?|SJ: I recommend software such as FL studio, Pro-Tools, and Ableton Live. It's vital that you are comfortable and understand the software you choose and love using it."];
    [QAList addObject: @"Production|16) Can producers/songwriters get beat/song placements via twitter?|SJ: Yes. It's all about getting it to the right person, approach,consistency...I get tons of beat/Song submissions sent to my email that I display on twitter everyday, and it's all just random people, so yes people do get major placements on twitter.  "];
    [QAList addObject: @"Production|17) Can an up and coming producer/songwriter get placements by showcasing their talent on youtube?|SJ: Yes! Look at acts like Justin Bieber.  He's a perfect example. I remember when Justin Beiber's manager showed me Justin on youtube, I thought he was amazing. It's always good to have a visual to your music. Record execs especially like to see how much youtube views you have, as well as the viewers' feedback. Majority of the talent scouting these days are done through youtube, so make sure what you decide to display through youtube is your best work, because someone is always listening and watching."];
    [QAList addObject: @"Production|18) When making a beat, what would be the best instrument to lay down first?|SJ: That would be a personal preference.  Some people like to lay down the drums first, while other people like to get the melody/sample going first, so it's all a personal preference. Only you the producer can figure that out."];
    [QAList addObject: @"Production|19) How would I know when my beats/songs are ready for the majors?|SJ: That's a very hard question to answer because it's a hit and miss business at times. Sometimes the majors choose records with simplicity, and some are chosen based on a particular feeling or just the right timing. So the best advice I can give you is, put your best foot forward, and have confidence in what you submit, and be open to all types of feedback. "];
    [QAList addObject: @"Production|20) When writing a song, what are some good things to do to motivate lyrics?|SJ: From my personal experience, some people watch movies with the tv on mute, others get inspired by other songs that are out, some are inspired by personal experiences such as bad break ups, great relationships, or bad one's. So everyone's inspirations are different, and can come from any where.  The one thing you can't do is force inspiration."];
    
    return QAList;
}

-(NSMutableArray *) submission1
{
    NSMutableArray *QAList = [[NSMutableArray alloc] init];
    
    [QAList addObject: @"Music Submission Protocol|1) When a major artist requests a certain style of music, should I submit exactly what they ask for or submit something outside the box to impress them?|SJ: It's important to study the artists previous work before you submit music.  You don't want to copy exactly what you've heard on previous projects, as artists usually grow and expand their sound with each release of their music. Listen to the formula and create something you think fits."];
    [QAList addObject: @"Music Submission Protocol|2) Can I submit the same beat and/or production to more than one artist?|SJ: Yes, do not limit yourself and hold on to your music in hopes of a particular artist to purchase it.  Move your music around to different camps within the industry, some of your tracks may work for multiple artists.\n\nIn addition, you may decide to pull a track off the market when:\nA) The label sent you a deal memo.\nB) They are paying you an upfront fee to secure the track.\nC) An artist recorded to it for their album/mixtape."];
    [QAList addObject: @"Music Submission Protocol|3) Being an up and coming producer, should I always have my music professionally mixed/mastered before submitting?|SJ: It is very important that all of the music you are submitting has a professional and polished mix.  It will give a great first impression.  Artists and A&Rs look for quality music when choosing tracks to record to, so make sure all of your sound levels have a standard quality mix."];
    [QAList addObject: @"Music Submission Protocol|4) As a producer, is it better to submit just a beat or a beat with a referenced vocal?|SJ: It is always better to submit a fully referenced song or beat with a chorus.  It helps the A&R's and/or artist see the vision of the track."];
    [QAList addObject: @"Music Submission Protocol|5) When submitting a referenced record, should I submit the instrumental along with the record and why?|SJ: Yes.  You want to eliminate the back and forth time with the record executive and/or artist. Always be prepared to provide the instrumentals."];
    [QAList addObject: @"Music Submission Protocol|6) How long should the intro be in a beat submission to a manager/artist/record executive?|SJ: Intros should be no longer than 8 bars, you want to captivate your listener right away."];
    [QAList addObject: @"Music Submission Protocol|7) What's an appropriate amount of tracks to send when submitting songs/beats to record executives/managers/artists?|SJ: Producers should submit 1 email with 4 mp3's attached and make sure to include all contact info.  A producer may be asked for more material if their sound is well received. "];
    [QAList addObject: @"Music Submission Protocol|8) When submitting a beat in mp3 form, via email, is it always necessary to name the mp3?|SJ: Always encode (name) your mp3s with your name and phone number."];
    [QAList addObject: @"Music Submission Protocol|9) If I submit a youtube link with a audio display of my beats, will that be just as good as submitting an mp3?|SJ: Record executives usually will not click on links from unknown sources, so stay with sending mp3's until you've established a relationship.   Also, visuals are great, even if you're a producer. Ie: Arrab Muzik (Producer) utilizes youtube to showcase his mpc skills and to market himself online."];
    [QAList addObject: @"Music Submission Protocol|10) If I submit a youtube link with me visually making a beat, can that land me a major placement?|SJ: It probably won't land you a major placement, but it will definitely draw some attention to your work.  If you're good, then the word will spread and interest will increase. Keep in mind, it is very important for producers to market themselves just like an artist. "];
    [QAList addObject: @"Music Submission Protocol|11) If I've submitted songs/beats to A&R's/record executives/artists and they haven't gotten back to me right away, does that mean they didn't like the songs/beats I submitted?|SJ: No, you can't mistake no communication for \"they didn't like your music\" or \"no one is paying attention to you.\" We are listening and paying attention.  We can't respond with feedback to everyone.  We are busy moving tracks around to see what fits with different artists.  Don't focus on the follow up, keep creating and reinventing yourself and it will eventually come!"];
    [QAList addObject: @"Music Submission Protocol|12) Do record companies and record executives still accept mailed CD demos?|SJ: Most record executives prefer to look at a EPK (Electronic Press Kit) or go to live performances.  Usually, it would be looked at as \"unsolicited material\" unless coming directly from a lawyer or a reputable manager or source."];
    [QAList addObject: @"Music Submission Protocol|13) If I attend a networking event or a music conference, what form of submission is more convenient?|SJ: We love to get flash drives at conferences! They are very effective and light weight.  CD demos are still cool to submit.  Always attach your contact info or business card on your CD demo.\n\nSJ Bonus Answer: Things you should NOT submit at a music conference with your material attached:\n\nA) A zip drive of your material?\nSJ: No\n\nB) A Cassette of your material?\nSJ: No\n\nC) A piece of paper with a myspace/facebook/soundclick/soundcloud link written on it?\nSJ: No, very unprofessional to have paper or CD demo with marker written on it.  Image and presentation is everything!"];
    [QAList addObject: @"Music Submission Protocol|14) As a songwriter, can I submit an acapella referencing a song or song idea? Would it be acceptable?|SJ: No, we like to hear full concepts, full songs.  No lyric sheets without music attached to it."];
    [QAList addObject: @"Music Submission Protocol|15) What if I'm a songwriter who doesn't make beats, can I submit a written song recorded on top of a well known beat/instrumental?|SJ: We usually don't like cover songs.  We like original music.  We want to get to know you and your sound, but not on top of someone else's material."];
    [QAList addObject: @"Music Submission Protocol|16) Who can I submit my songs/beats to in order to get it directly to the artist?|SJ: Usually to a reputable manager, A&R, directly to the artist, or a recording engineer."];
    [QAList addObject: @"Music Submission Protocol|17) If I get a major song/beat placement via an emailed mp3 submission, what would be the next step of submissions? And should I email the file session?|SJ: You should hire an attorney.  If you don't have one then wait for the producer dec (document stating a label is going to purchase a track) to be sent to you.  Do not give the session files until you have either the front end payment for the track and producer dec sent to you, or a royalty share split sheet agreement."];
    [QAList addObject: @"Music Submission Protocol|18) If I meet a record executive/artist manager/producer manger and he/she gives me a Gmail, hotmail, or yahoo email for submitting production/music, not a company email, does that mean he/she may not be as reputable or trustworthy?|SJ: This is not always true, as many record executives use Gmail accounts.  Always do your own research and reference checks."];
    [QAList addObject: @"Music Submission Protocol|19) What are the pros and cons of adding a recorded tag to my beat submissions?|SJ: One tag in the intro of your track is cool.  You never want to run your producer tag through the entire track.  You want an artist to get on your track, not get turned off from your tags throughout the track and/or beat."];
    [QAList addObject: @"Music Submission Protocol|20) What format should my audio be in when submitting music:|A) MP3 File?\nSJ: Yes, at all times.\n\nB) Wav File?\nSJ: No\n\nC) AIFF File?\nSJ: No\n\nD) m4a File?\nSJ: No"];  
    return QAList;
}

-(NSMutableArray *) submission2
{
    NSMutableArray *QAList = [[NSMutableArray alloc] init];
    [QAList addObject: @"Production/Songwriting Submission Opportunities|1) How can I submit my beats or written songs?|Please refer to Sarah J's twitter account for all submission information and opportunities: @SJmanager"];
    
    return QAList;
}
-(NSMutableArray *) submission3
{
    NSMutableArray *QAList = [[NSMutableArray alloc] init];
    [QAList addObject: @"Music Submission Opportunities|1) I am a recording artist, how can I submit my music?|Please refer to Sarah J's twitter account for all submission information and opportunities: @SJmanager"];
    
    return QAList;
}

-(NSMutableArray *) booking
{
    NSMutableArray *QAList = [[NSMutableArray alloc] init];
    [QAList addObject: @"Booking Information|1) How can I book/invite Sarah to come to my city/country?|Email for booking Sarah J to come to your city/country for a music conference/consulting is Booksarahj2day@gmail.com"];
    
    return QAList;
}

@end
