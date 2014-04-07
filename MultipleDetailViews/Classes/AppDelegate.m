

#import "AppDelegate.h"
#import "FIrstTestViewController.h"

@implementation AppDelegate

#pragma mark -

// -------------------------------------------------------------------------------
//	applicationDidFinishLaunching:application
// -------------------------------------------------------------------------------
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
    /*
    NSLog(@"a");
    FirstTestViewController *ftvc= [[FirstTestViewController alloc] initWithNibName:@"FirstTestView" bundle:nil];
    NSLog(@"Init");
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    NSLog(@"ok");
    self.window.rootViewController = ftvc;
    NSLog(@"bouh");
    [self.window makeKeyAndVisible];
    NSLog(@"maaais");
    [ftvc release];
	*/
	// Initialize the app window
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController = self.splitViewController;
    [self.window makeKeyAndVisible];
    
    // This checks if the setting to enable it is available and
    // sets it to YES if so.
    if ([self.splitViewController respondsToSelector:@selector(setPresentsWithGesture:)])
        [self.splitViewController setPresentsWithGesture:YES];
    
	return YES;
}

// -------------------------------------------------------------------------------
//	dealloc
// -------------------------------------------------------------------------------
- (void)dealloc 
{
    [_detailViewManager release];
    [_splitViewController release];
    [_window release];
    [super dealloc];
}


@end
