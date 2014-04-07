//
//  FirstTest.m
//  MultipleDetailViews
//
//  Created by Thomas on 07/04/14.
//
//

#import "FirstTestViewController.h"

@interface FirstTestViewController ()

@end

@implementation FirstTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    _GoButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] init];
    [_GoButton addTarget:self
                  action:@selector(go)
        forControlEvents:UIControlEventTouchUpInside];
    [_GoButton setTitle:@"Show View" forState:UIControlStateNormal];
    _GoButton.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:_GoButton];
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)go
{
    NSLog(@"test");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
