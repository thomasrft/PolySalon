

#import <UIKit/UIKit.h>
#import "DetailViewManager.h"

@interface SecondDetailViewController : UIViewController <SubstitutableDetailViewController>

/// Things for IB
@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar;
/// SubstitutableDetailViewController
@property (nonatomic, retain) UIBarButtonItem *navigationPaneBarButtonItem;

@end
