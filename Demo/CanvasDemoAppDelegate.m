//  Created by Jason Morrissey

#import "CanvasDemoAppDelegate.h"
#import "DemoViewController.h"

@implementation CanvasDemoAppDelegate

@synthesize window = window_;
@synthesize navigationController = navigationController_;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
	DemoViewController * demoViewController = [[[DemoViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:demoViewController] autorelease];
    [self.navigationController setNavigationBarHidden:YES];

    self.window = [[[UIWindow alloc] init] autorelease];
    [self.window addSubview:self.navigationController.view];
    [self.window makeKeyAndVisible];
    
    [[demoViewController view] setBackgroundColor:[UIColor whiteColor]];
    return YES;
}

- (void)dealloc 
{
	self.navigationController = nil;
    self.window = nil;
	[super dealloc];
}


@end

