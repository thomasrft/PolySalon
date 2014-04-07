//
//  PSDocType.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSObjectWithName.h"

@interface PSType : NSObject<PSObjectWithName>

@property (nonatomic,copy) NSString* name;

- (id)initWithName:(NSString*)aName;


@end
