//
//  PSSetOfTypes.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 12/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSSetOfTypes.h"
#import "PSType.h"

@implementation PSSetOfTypes

- (NSString *)description {
    return [NSString stringWithFormat: @"PSSetOfTypes: %@", self.dico];
}

// *************************************************************************************
// initializers

- (id)init
{
    self = [super init];
    return self;
}
- (id)initWithArray:(NSArray *)anArray
{
    self = [super initWithArray:anArray];
    return self;
}
- (id)initWithSet:(NSSet *)aSet
{
    self = [super initWithSet:aSet];
    return self;
}

// *************************************************************************************
// Add (PSTypes*) in set

// add a PSType into the set
- (void)addType:(PSType*) aType{
    [super addObject:aType forName:[aType name]];
}

// add a newly created PSType of name aName into the set
// return the newly created PSType
- (PSType*) addTypeOfName:(NSString*)aName{
    PSType* docType=[[PSType alloc] initWithName:aName];
    [super addObject:docType forName:aName];
    return docType;
}

// *************************************************************************************
// remove (PSTypes*) in set

// remove PSType with the given name of the set
// return PSType removed
// Exception thrown: object of this name not present in set
- (PSType*) removeTypeOfName:(NSString*)aName{
    PSType* docType = [super removeObjectForName:aName];
    return docType;
}

// remove a given object of the set
// return PSType removed
// Exception thrown: object of this name not present in set - thrown if PSType with same name as the one in argument is not present in the set
// Exception thrown: object of this name present in set is not the one to remove - thrown if PSType with same name as the one in argument is not the on given in argument
- (PSType*)removeType:(PSType*) aType{
    return [super removeObject:aType forName:[aType name]];
}


// *************************************************************************************
// contains

// check if a given PSType belongs to the set
- (BOOL)containsType:(PSType*) aType{
    return [super containsObject:aType forName:[aType name]];
}

// check if a PSType with aName belongs to the set
- (BOOL)containsTypeOfName:(NSString*)aName{
    return ([super objectForName:aName]!=nil);
}


// *************************************************************************************
// get

// return PSType of name aName contained in the set ; return nil no PSType of the set has this name
- (PSType*) typeOfName:(NSString*)aName{
    return [super objectForName:aName];
}



@end
