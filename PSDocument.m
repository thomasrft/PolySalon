//
//  PSDocument.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSDocument.h"

// *************************************************************************************
//
// class managing a Document to be sent to users
// defined by a
// - name
// - type
// - area -- could be nil, i.e. a document could have no area
//
@implementation PSDocument

- (NSString *)description {
    return [NSString stringWithFormat: @"PSDocument: Name=%@ - Type=%@ - Area=%@", self.name, [self.type name], [self.area name]];
}

// *************************************************************************************
// initializers

// initialize document with a name, a type and an area
- (id)initWithName:(NSString *)aName type:(PSType*)aType andArea:(PSArea*)anArea
{
    self = [super init];
    if (self) {
        _name = aName;
        _area = nil;
        _type = aType;
        if(anArea!=nil) self.area=anArea;
    }
    return self;
}

// initialize document with a name and a type
// area is set to nil
- (id)initWithName:(NSString *)name andType:(PSType*) type
{
    return [self initWithName:name type:type andArea:nil];
}

// *************************************************************************************
// accessors

// setter of area is overloaded to manage one to one relationship
// if document had an are, this are will be removed so this document should be removed from the are
// new area is set for this document, then this document is added to the area
- (void) setArea:(PSArea *)area{
    if(self->_area!=nil){
        [self->_area removeDocument:self];
    }
    self->_area=area;
    [area addDocument:self];
}


@end
