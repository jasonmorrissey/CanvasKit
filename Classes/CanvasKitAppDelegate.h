//  Created by Jason Morrissey

@interface CanvasKitAppDelegate : NSObject <UIApplicationDelegate> 
{
    UIWindow *window_;
    UINavigationController *navigationController_;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;

@end

