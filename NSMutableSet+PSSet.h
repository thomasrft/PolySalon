//
//  NSMutableSet+PSSet.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 13/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>

// *************************************************************************************
//
// Category adding the capability of getting a sorted Array of data according to a property
// this property should be a NSString
//
@interface NSMutableSet (PSSet)

- (NSArray*) sortedArrayByPropertyName:(NSString*)propertyName;

@end
