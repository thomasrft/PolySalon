

#import "FirstTableViewController.h"
#import "DetailViewManager.h"
#import "SecondTableViewController.h"
#import "FirstDetailViewController.h"
#import "SecondDetailViewController.h"

@implementation FirstTableViewController

#pragma mark -
#pragma mark Rotation support

// -------------------------------------------------------------------------------
//	shouldAutorotateToInterfaceOrientation:
// -------------------------------------------------------------------------------
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return YES;
}

#pragma mark -
#pragma mark Table view data source

// -------------------------------------------------------------------------------
//	tableView:numberOfRowsInSection:
// -------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section 
{
    
    // Three rows.
    return 3;
}

//This is the function called to switch from Pools to Documents
- (IBAction)flipViewToDocs
{
    SecondTableViewController *newTableViewController = [[SecondTableViewController alloc] init];
    [self.navigationController pushViewController:newTableViewController animated:YES];
    
    [newTableViewController release];
}

// -------------------------------------------------------------------------------
//	tableView:cellForRowAtIndexPath:
// -------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Initialisation du bouton qui renvoie aux documents
    UIBarButtonItem *changeViewButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Documents"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(flipViewToDocs)];

    self.navigationItem.rightBarButtonItem = changeViewButton;
    
    static NSString *CellIdentifier = @"Documents";
    
    // Dequeue or create a cell of the appropriate type.
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set appropriate labels for the cells.
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Pools";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // ICI pour charger les documents en mémoire
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"Créer DOcuments";
        cell.accessoryType = UITableViewCellAccessoryNone ;
    }
    else if (indexPath.row==2){
        cell.textLabel.highlighted= YES;
        cell.textLabel.text = @"Créer Pools";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

#pragma mark -
#pragma mark Table view selection

// -------------------------------------------------------------------------------
//	tableView:didSelectRowAtIndexPath:
// -------------------------------------------------------------------------------
/////// C'est dans cette fonction que se décident les accès aux autres tableView.
/// REF NEWTABVIEW
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Get a reference to the DetailViewManager.  
    // DetailViewManager is the delegate of our split view.
    DetailViewManager *detailViewManager = (DetailViewManager*)self.splitViewController.delegate;
    
    NSUInteger row = indexPath.row;
    
    if (row == 0) {
    }
    else if (row==1){
        // Create and configure a new detail view controller appropriate for the selection.
        UIViewController <SubstitutableDetailViewController> *detailViewController = nil;
        
        SecondDetailViewController *newDetailViewController = [[SecondDetailViewController alloc] initWithNibName:@"SecondDetailView" bundle:nil];
        detailViewController = newDetailViewController;
        
        detailViewController.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        
        // DetailViewManager exposes a property, detailViewController.  Set this property
        // to the detail view controller we want displayed.  Configuring the detail view
        // controller to display the navigation button (if needed) and presenting it
        // happens inside DetailViewManager.
        detailViewManager.detailViewController = detailViewController;
        
        [newDetailViewController release];
        
    }
    else {
        // Create and configure a new detail view controller appropriate for the selection.
        UIViewController <SubstitutableDetailViewController> *detailViewController = nil;
        
        FirstDetailViewController *newDetailViewController = [[FirstDetailViewController alloc] initWithNibName:@"FirstDetailView" bundle:nil];
        detailViewController = newDetailViewController;
        
        detailViewController.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        
        // DetailViewManager exposes a property, detailViewController.  Set this property
        // to the detail view controller we want displayed.  Configuring the detail view
        // controller to display the navigation button (if needed) and presenting it
        // happens inside DetailViewManager.
        detailViewManager.detailViewController = detailViewController;
        
        [newDetailViewController release];
    }
}

@end
