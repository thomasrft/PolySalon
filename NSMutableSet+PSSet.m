//
//  NSMutableSet+PSSet.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 13/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "NSMutableSet+PSSet.h"

@implementation NSMutableSet (PSSet)

- (NSArray*) sortedArrayByPropertyName:(NSString*)propertyName{
    NSSortDescriptor* sortDesc = [NSSortDescriptor sortDescriptorWithKey:propertyName ascending:YES
                                                                selector:@selector(caseInsensitiveCompare:)];
    NSArray* anArray = [self sortedArrayUsingDescriptors:@[sortDesc]];
    return anArray;
}

@end
