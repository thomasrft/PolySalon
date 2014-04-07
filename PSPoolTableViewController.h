//
//  PSPoolTableViewController.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 10/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSLibrary.h"
#import "PSDataDocuments.h"

@interface PSPoolTableViewController : UITableViewController

@property (nonatomic,strong,readonly) PSLibrary* library;
@property (nonatomic,strong,readonly) PSDataDocuments* dataDocuments;

@end
