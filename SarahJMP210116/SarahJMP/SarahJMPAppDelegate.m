//
//  SarahJMPAppDelegate.m
//  SarahJMP
//
//  Created by Larry Seymour on 12-06-09.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SarahJMPAppDelegate.h"
#import "AdviceUIController.h"
#import "SearchViewController.h"
#import "SarahjViewController.h"
#import "CategoryViewController.h"
#import "DisclaimerViewController.h"
#import "HelpViewController.h"

@implementation SarahJMPAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    /*
    UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    UIViewController *viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    */
    
    sleep(5);
    
    // Add the tab bar controller's current view as a subview of the window.
    CategoryViewController *catVC = [[CategoryViewController alloc] initWithNibName:@"CategoryViewController" bundle:nil];
    AdviceUIController *adviceVC = [[AdviceUIController alloc] initWithNibName:@"AdviceUIController" bundle:nil];
    SearchViewController *searchVC = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    SarahJViewController *sarahjVC = [[SarahJViewController alloc] initWithNibName:@"SarahJViewController" bundle:nil];
    DisclaimerViewController *disclaimerVC = [[DisclaimerViewController alloc] initWithNibName:@"DisclaimerViewController" bundle:nil];
    HelpViewController *helpVC = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];

    //Create UINavController
    UINavigationController *category = [[UINavigationController alloc] initWithRootViewController:catVC];
    UINavigationController *advice = [[UINavigationController alloc] initWithRootViewController:adviceVC];
    UINavigationController *search = [[UINavigationController alloc] initWithRootViewController:searchVC];
    UINavigationController *sarahj = [[UINavigationController alloc] initWithRootViewController:sarahjVC];
    UINavigationController *disclaimer = [[UINavigationController alloc] initWithRootViewController:disclaimerVC];
    UINavigationController *help = [[UINavigationController alloc] initWithRootViewController:helpVC];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects: category,advice,search,sarahj,disclaimer,help,nil];
    self.window.rootViewController = self.tabBarController;
    

                                          
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
