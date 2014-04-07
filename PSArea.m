//
//  PSArea.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSArea.h"
#import "PSDocument.h"

// *************************************************************************************
//
// class managing an area of document
//
@implementation PSArea

- (NSString *)description {
    return [NSString stringWithFormat: @"PSArea: Name=%@ - %d Documents : %@", self.name,[self.docsList count], self.docsList];
}

// *************************************************************************************
// initializers

// base initializer: an area with a name and no documents related
- (id)initWithName:(NSString *)aName
{
    self = [super init];
    if (self) {
        _name = aName;
        _docsList = [NSMutableSet setWithCapacity:10];
    }
    return self;
}

// initializer with a set of document: an area with a name and a set of document that is of this are. This initializer check that each document has the right are
- (id)initWithName:(NSString *)aName andDocsSet:(NSSet *)list
{
    self = [self initWithName:aName];
    if (self) {
        for(PSDocument* doc in list){
            [self addDocument:doc];
        }
    }
    return self;
}

// initializer with a set of document: an area with a name and a set of document that is of this are. This initializer check that each document has the right are
- (id)initWithName:(NSString *)aName andDocsArray:(NSArray *)list
{
    self = [self initWithName:aName];
    if (self) {
        for(PSDocument* doc in list){
            [self addDocument:doc]; // check is done by addDocument
        }
    }
    return self;
}

// *************************************************************************************

// add a document to this area
// if doc hasn't yet an area, add self as area of this doc
// Exception thrown: Add document in area failed if document added has another are
- (id) addDocument:(PSDocument*)doc{
    if ([doc area]==nil) {
        [doc setArea:self];
    }
    else if([doc area]!=self){
        @throw [NSException
                exceptionWithName:@"Add document in area failed" reason:@"add document in area with another area" userInfo:nil];
    }
    else if(![self.docsList containsObject:doc]){
        [self.docsList addObject:doc];
    }
    return doc;
}
// remove a document from this area
// remove also this area as area of this document
- (id) removeDocument:(PSDocument*)doc{
    [self.docsList removeObject:doc];
    [doc setArea:nil];
    return doc;
}
// get an area of all documents of this area
- (NSArray*) allDocuments{
    return [self.docsList allObjects];
}
// get a sorted by document name of all documents of this area
- (NSArray*) allDocumentsSortedByName{
    return [self.docsList sortedArrayByPropertyName:@"name"];
}

// number of documents of this area
-(NSInteger) numberOfDocuments{
    return [self.docsList count];
}


@end
