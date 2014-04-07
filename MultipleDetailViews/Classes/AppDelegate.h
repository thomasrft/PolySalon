

#import <UIKit/UIKit.h>
#import "DetailViewManager.h"

@interface AppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) UIWindow *window;
/// Things for IB
@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;
// DetailViewManager is assigned as the Split View Controller's delegate.
// However, UISplitViewController maintains only a weak reference to its
// delegate.  Someone must hold a strong reference to DetailViewManager
// or it will be deallocated after the interface is finished unarchieving.
@property (nonatomic, retain) IBOutlet DetailViewManager *detailViewManager;

@end

