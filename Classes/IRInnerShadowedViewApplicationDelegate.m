//
//  iridia_IRInnerShadowedViewAppDelegate.m
//  iridia-IRInnerShadowedView
//
//  Created by Evadne Wu on 6/21/10.
//  Copyright Iridia Productions 2010. All rights reserved.
//

#import "IRInnerShadowedViewApplicationDelegate.h"





@implementation IRInnerShadowedViewApplicationDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	//	Override point for customization after application launch.
	
	[window makeKeyAndVisible];
	
	IRInnerShadowedView *testView = [[[IRInnerShadowedView alloc] initWithFrame:CGRectInset(window.frame, 64, 64)] autorelease];
	
	testView.backgroundColor = [UIColor redColor];
	testView.layer.cornerRadius = 12.0f;
	testView.layer.masksToBounds = YES;
	testView.irShadowColor = [UIColor colorWithWhite:0.0f alpha:0.75f];
	testView.irShadowSpread = 8.0f;
	
	[window addSubview:testView];
	
	return YES;
	
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
