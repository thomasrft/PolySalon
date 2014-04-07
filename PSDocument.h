//
//  PSDocument.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSType.h"
#import "PSArea.h"

// *************************************************************************************
//
// class managing a Document to be sent to users
// defined by a
// - name
// - type
// - area -- could be nil, i.e. a document could have no area
//
@interface PSDocument : NSObject

// name of the document
@property (nonatomic,copy) NSString* name;
// type of document
@property (nonatomic,weak) PSType* type;
// area of document - relationship between document is managed:
// when a document has an area, this area should have the document in its set
@property (nonatomic,weak) PSArea* area;

// initialize document with a name and a type
// area is set to nil
- (id) initWithName:(NSString*)name andType:(PSType*) type;

// initialize document with a name, a type and an area
- (id) initWithName:(NSString*)name type:(PSType*) type andArea:(PSArea*) area;

@end
