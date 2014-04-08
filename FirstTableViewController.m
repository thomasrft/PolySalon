

#import "FirstTableViewController.h"
#import "DetailViewManager.h"
#import "SecondTableViewController.h"
#import "DetailViewController.h"
#import "SecondDetailViewController.h"
#import "SalonSelectTableViewController.h"
#import "PSPoolTableViewController.h"
#import "CreateDocument.h"

@implementation FirstTableViewController

#pragma mark -
#pragma mark Rotation support

-(void)viewDidLoad
{
    self.navigationItem.title=@"Pools";
}

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
}
- (IBAction)selectSalon
{
    SalonSelectTableViewController *newSalon = [[SalonSelectTableViewController alloc] init];
    [self.navigationController pushViewController:newSalon animated:YES];
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
    UIBarButtonItem *selectSalonButton =[[UIBarButtonItem alloc]
                                         initWithTitle:@"Salon"
                                         style:UIBarButtonItemStyleBordered
                                         target:self
                                         action:@selector(selectSalon)];
    self.navigationItem.leftBarButtonItem=selectSalonButton;
    
    static NSString *CellIdentifier = @"Documents";
    
    // Dequeue or create a cell of the appropriate type.
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set appropriate labels for the cells.
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Pools";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // ICI pour charger les documents en mémoire
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"Créer Documents";
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
        UIViewController <SubstitutableDetailViewController> *detailViewController = nil;
        
        CreateDocument *newDetailViewController = [[CreateDocument alloc] initWithNibName:@"View"
         bundle:nil];
        detailViewController=newDetailViewController;
        detailViewController.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        
        // DetailViewManager exposes a property, detailViewController.  Set this property
        // to the detail view controller we want displayed.  Configuring the detail view
        // controller to display the navigation button (if needed) and presenting it
        // happens inside DetailViewManager.
        detailViewManager.detailViewController = detailViewController;

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
        
    }
    else {
        // Create and configure a new detail view controller appropriate for the selection.
        UIViewController <SubstitutableDetailViewController> *detailViewController = nil;
        
        DetailViewController *newDetailViewController = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil];
        detailViewController = newDetailViewController;
        
        detailViewController.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        
        // DetailViewManager exposes a property, detailViewController.  Set this property
        // to the detail view controller we want displayed.  Configuring the detail view
        // controller to display the navigation button (if needed) and presenting it
        // happens inside DetailViewManager.
        detailViewManager.detailViewController = detailViewController;
        
    }
}

@end
