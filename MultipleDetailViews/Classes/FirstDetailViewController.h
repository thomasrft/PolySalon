

#import <UIKit/UIKit.h>
#import "DetailViewManager.h"

@interface FirstDetailViewController : UIViewController <SubstitutableDetailViewController>

/// Things for IB
@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
/// SubstitutableDetailViewController
@property (nonatomic, retain) UIBarButtonItem *navigationPaneBarButtonItem;

@end
