//
//  SalonSelectViewTableViewController.h
//  Polytech Salon
//
//  Created by Thomas on 08/04/14.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSLibrary.h"
#import "PSDataDocuments.h"

@interface SalonSelectTableViewController : UITableViewController
@property (nonatomic,strong,readonly) PSLibrary* library;
@property (nonatomic,strong,readonly) PSDataDocuments* dataDocuments;
@end
