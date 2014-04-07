//
//  PSSetOfAreas.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 12/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSSetOfAreas.h"
#import "PSArea.h"

// *************************************************************************************
//
// class managing a set of areas
// areas are indexed by their names
// is objserver of area name property to change indexing accordingly to name changes
//
@implementation PSSetOfAreas

- (NSString *)description {
    return [NSString stringWithFormat: @"PSSetOfAreas: %@", self.dico];
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
// Add (PSArea*) in set

// add a PSArea into the set
- (void)addArea:(PSArea*) anArea{
    [super addObject:anArea forName:[anArea name]];
}

// add a newly created PSArea of name aName into the set
// return the newly created PSArea
- (PSArea*) addAreaOfName:(NSString*)aName{
    PSArea* area=[[PSArea alloc] initWithName:aName];
    [super addObject:area forName:aName];
    return area;
}


// *************************************************************************************
// remove (PSArea*) in set


// remove PSArea with the given name of the set
// return PSArea removed
// Exception thrown: object of this name not present in set
- (PSArea*) removeAreaOfName:(NSString*)aName{
    PSArea* area = [super removeObjectForName:aName];
    return area;
}

// remove a given object of the set
// return PSArea removed
// Exception thrown: object of this name not present in set - thrown if PSArea with same name as the one in argument is not present in the set
// Exception thrown: object of this name present in set is not the one to remove - thrown if PSArea with same name as the one in argument is not the on given in argument
- (PSArea*)removeArea:(PSArea*) anArea{
    return [super removeObject:anArea forName:[anArea name]];
}

// *************************************************************************************
// contains

// check if a given PSArea belongs to the set
- (BOOL)containsArea:(PSArea *)anArea{
    return [super containsObject:anArea forName:[anArea name]];
}

// check if a PSArea with aName belongs to the set
- (BOOL)containsAreaOfName:(NSString*)aName{
    return ([super objectForName:aName]!=nil);
}


// *************************************************************************************
// get

// return PSType of name aName contained in the set ; return nil no PSType of the set has this name
- (PSArea*) areaOfName:(NSString*)aName{
    return [super objectForName:aName];
}


@end
