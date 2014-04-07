//
//  PSArea.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableSet+PSSet.h"
#import "PSObjectWithName.h"

@class PSDocument;

// *************************************************************************************
//
// class managing an area of document
//
@interface PSArea : NSObject<PSObjectWithName>

@property (nonatomic,copy) NSString* name;
@property (nonatomic,readonly,strong) NSMutableSet*  docsList;

// *************************************************************************************
// initializers

// base initializer: an area with a name and no documents related
- (id) initWithName:(NSString*)name;
// initializer with a set of document: an area with a name and a set of document that is of this are. This initializer check that each document has the right are
- (id) initWithName:(NSString*)name andDocsSet:(NSSet*) list;
// same as the precedent but with an array instead a set
- (id)initWithName:(NSString *)aName andDocsArray:(NSArray *)list;


// *************************************************************************************

// add a document to this area
// if doc hasn't yet an area, add self as area of this doc
// Exception thrown: Add document in area failed if document added has another are
- (id) addDocument:(PSDocument*)doc;
// remove a document from this area
// remove also this area as area of this document
- (id) removeDocument:(PSDocument*)doc;
// get an area of all documents of this area
- (NSArray*) allDocuments;
// get a sorted by document name of all documents of this area
- (NSArray*) allDocumentsSortedByName;

// number of documents of this area
-(NSInteger) numberOfDocuments;

@end
