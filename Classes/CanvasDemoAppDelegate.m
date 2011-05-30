//  Created by Jason Morrissey

#import "CanvasKitAppDelegate.h"
#import "CanvasViewController.h"

@implementation CanvasKitAppDelegate

@synthesize window = window_;
@synthesize navigationController = navigationController_;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
	CanvasViewController * cvc = [[[CanvasViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:cvc] autorelease];

    self.window = [[[UIWindow alloc] init] autorelease];
    [self.window addSubview:self.navigationController.view];
    [self.window makeKeyAndVisible];
    
    [[cvc view] setBackgroundColor:[UIColor whiteColor]];
    return YES;
}

- (void)dealloc 
{
	self.navigationController = nil;
    self.window = nil;
	[super dealloc];
}


@end

