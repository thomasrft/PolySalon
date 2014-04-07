//
//  PSSetOfObject.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 12/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSObjectWithName.h"
#import "CFModelObserved.h"
#import "CFDefaultModelObserved.h"

// set of objects with a name property
// set is indexed and objects can be retrieved by their name
// if name property of an object belonging to the set is changed, then index is change accordingly
// as object are observed by the set, you should remove them or clean the set before deleting it in order to avoid memory leak
// object into the set must conform to PSObjectWithName protocol
@interface PSSetIndexedByName : NSObject<CFModelObserved>
{
    //    @private NSMutableDictionary* dico;
    @private CFDefaultModelObserved* _dataModelDelegate;
}

@property NSMutableDictionary* dico;

- (id) init;
- (id) initWithArray:(NSArray*)anArray;
- (id) initWithSet:(NSSet*)aSet;

// *************************************************************************************
// Add object in set

// add an object into the set, associated key is the object name
// register itself as an observer of name property of object inserted
// Exception thrown: object of this name already present in set
- (id)addObject:(NSObject<PSObjectWithName>*)object forName:(NSString*)aName;

// *************************************************************************************
// remove object from set

// remove object with the given name of the set, remove also self as observer of property name
// return object removed
// Exception thrown: object of this name not present in set
- (id)removeObjectForName:(NSString*)aName;
// remove a given object with a given name from the set, remove also self as observer of property name
// return object removed
// Exception thrown: object of this name not present in set
// Exception thrown: object of this name present in set is not the one to remove
- (id)removeObject:(id)object forName:(NSString*)aName;
// remove a given object from the set, remove also self as observer of property name
// return object removed
// Exception thrown: object of this name not present in set
// Exception thrown: object of this name present in set is not the one to remove
- (id)removeObject:(id)object;

// *************************************************************************************
// contains

// check if an object with a given name belongs to the set
- (BOOL)containsObjectForName:(NSString*)aName;
// check if a given object with a given name belongs to the set
- (BOOL)containsObject:(id)object forName:(NSString*)aName;
// check if a given object belongs to the set
// Exception thrown: object in the set has not the same name
- (BOOL)containsObject:(id<PSObjectWithName>)object;

// *************************************************************************************
// get

// return object of name aName contained in the set ; return nil no object of the set has this name
- (id) objectForName:(NSString*)object;

// *************************************************************************************

// returns number of objects contained in the set
- (NSUInteger)count;
// return an array of all object names
- (NSArray *)allNames;


// *************************************************************************************

// return a new array containing objects of the set.
- (NSArray*) allObjects;
// return a new array containing objects of the set sorted by their name
- (NSArray*) sortedArrayByName;

// remove all object of the set; useful to unregister observers
- (void) empty;

// *************************************************************************************

- (void)addObserver:(id<CFObserver>) observer;
- (void)removeObserver:(id<CFObserver>) observer;
- (void)postNotification;
- (void)postNotificationWithName:(NSString*)aName;


@end
