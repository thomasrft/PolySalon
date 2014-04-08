//
//  CreateDocument.m
//  Polytech Salon
//
//  Created by Thomas on 08/04/14.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "CreateDocument.h"

@implementation CreateDocument
@synthesize lab;
// -------------------------------------------------------------------------------
//	dealloc
// -------------------------------------------------------------------------------
- (void)dealloc
{
    self.toolbar = nil;
    self.titleLabel = nil;
    self.navigationPaneBarButtonItem = nil;
}

#pragma mark -
#pragma mark SubstitutableDetailViewController

// -------------------------------------------------------------------------------
//	setNavigationPaneBarButtonItem:
//  Custom implementation for the navigationPaneBarButtonItem setter.
//  In addition to updating the _navigationPaneBarButtonItem ivar, it
//  reconfigures the toolbar to either show or hide the
//  navigationPaneBarButtonItem.
// -------------------------------------------------------------------------------
- (void)setNavigationPaneBarButtonItem:(UIBarButtonItem *)navigationPaneBarButtonItem
{
    [super setNavigationPaneBarButtonItem:navigationPaneBarButtonItem];
}

#pragma mark -
#pragma mark View lifecycle

// -------------------------------------------------------------------------------
//	viewDidLoad:
// -------------------------------------------------------------------------------
- (void)viewDidLoad
{
        lab.text=@"KAKAKAKA";
    // -setNavigationPaneBarButtonItem may have been invoked when before the
    // interface was loaded.  This will occur when setNavigationPaneBarButtonItem
    // is called as part of DetailViewManager preparing this view controller
    // for presentation as this is before the view is unarchived from the NIB.
    // When viewidLoad is invoked, the interface is loaded and hooked up.
    // Check if we are supposed to be displaying a navigationPaneBarButtonItem
    // and if so, add it to the toolbar.
    [super viewDidLoad];
}

// -------------------------------------------------------------------------------
//	viewWillAppear:
// -------------------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.titleLabel.text = self.title;
}

// -------------------------------------------------------------------------------
//	viewDidUnload:
// -------------------------------------------------------------------------------
- (void)viewDidUnload {
	[super viewDidUnload];
	self.toolbar = nil;
    self.titleLabel = nil;
}

#pragma mark -
#pragma mark Rotation support

// -------------------------------------------------------------------------------
//	shouldAutorotateToInterfaceOrientation:
// -------------------------------------------------------------------------------
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}
@end
