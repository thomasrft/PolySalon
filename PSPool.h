//
//  PSPool.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSDocument.h"

@interface PSPool : NSObject

@property (nonatomic,copy) NSString* name;
@property (nonatomic,readonly,strong) NSMutableSet* docsList;

- (id) initWithName:(NSString*)name;

- (void) addDoc:(PSDocument*)doc;
- (void) delDoc:(PSDocument*)doc;

@end
