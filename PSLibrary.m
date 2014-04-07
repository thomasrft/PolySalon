//
//  PSLibrary.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSLibrary.h"
#import "NSMutableSet+PSSet.h"
#import "PSDocument.h"

@implementation PSLibrary

// description methods to output (NSLog) PSLibrary object
- (NSString *)description {
    NSMutableString* desc = [NSMutableString stringWithFormat:@"PSLibrary:\n"];
    int i=0;
    for(PSDocument* doc in self.docs){
        [desc appendFormat:@"document[%d]=%@\n",i++,doc];
    }
    return desc;
}

// *************************************************************************************
//
// methods managing property files
//

// read the property file and put data into a NSDictionnary
- (NSDictionary*) readPropertyFile{
    NSFileManager* filemgr;
    NSString* dataFile;
    NSString* docsDir;
    NSArray*  dirPaths;
    
    // get default file manager
    filemgr = [NSFileManager defaultManager];
    // Identify the documents directory
    
    // Creates a list of directory search paths,
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory,// Document directory of the IOS App
     NSUserDomainMask,   // The user’s home directory where files should go
     YES);               // tilde expanded for absolute path
    docsDir = dirPaths[0];
    // Build the path to the data file
    dataFile = [docsDir stringByAppendingPathComponent:@"Library property.plist"];
    // check to see if Data.plist exists in documents
    if (![filemgr fileExistsAtPath:dataFile]){
        // if not in documents, get property list from main bundle
        dataFile = [[NSBundle mainBundle] pathForResource:@"Library property" ofType:@"plist"];
    }
    return [[NSDictionary alloc] initWithContentsOfFile:dataFile];
}

// create a NSDictionnary from library data ready to be save into a property file
- (NSDictionary*) propertyDictionnary{
    NSMutableArray* pdictDocs = [NSMutableArray arrayWithCapacity:[self.docs count]];
    for(PSDocument* doc in self.docs){
        [pdictDocs addObject:[NSDictionary dictionaryWithObjects:@[doc.name,[doc.area name],[doc.type name]] forKeys:@[@"name",@"area",@"type"]]];
    }
    NSDictionary* pdict = [NSDictionary dictionaryWithObjects:@[[self.types allNames],[self.areas allNames],pdictDocs]
                                                      forKeys:@[@"types",@"areas",@"documents"]];
    return pdict;
}

// write a NSDictionnary pdict (usually created by propertyDictionnary method) to a file with filename name
- (void) writePropertyFile:(NSDictionary*)pdict toFile:(NSString*)fileName{
    [pdict writeToFile:fileName atomically:YES];
}

// save all data: call propertyDictionnary and writePropertyFile:toFile methods
- (void) saveData{
    NSFileManager* filemgr;
    NSString* dataFile;
    NSString* docsDir;
    NSArray*  dirPaths;
    NSDictionary* pdict=[self propertyDictionnary];
    
    // get default file manager
    filemgr = [NSFileManager defaultManager];
    // Identify the documents directory
    
    // Creates a list of directory search paths,
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory,// Document directory of the IOS App
     NSUserDomainMask,   // The user’s home directory where files should go
     YES);               // tilde expanded for absolute path
    docsDir = dirPaths[0];
    // Build the path to the data file
    dataFile = [docsDir stringByAppendingPathComponent:@"Library property.plist"];
    // check to see if Data.plist exists in documents
    if (![filemgr fileExistsAtPath:dataFile]){
        // if not in documents, get property list from main bundle
        dataFile = [[NSBundle mainBundle] pathForResource:@"Library property" ofType:@"plist"];
    }
    NSLog(@"file=%@",dataFile);
    [pdict writeToFile:dataFile atomically:YES];
}


// *************************************************************************************
//
// initializers
//


// initializer from property file. Should be the one used;
- (id)initWithPropertyList
{
    self = [super init];
    if(self){
        NSDictionary* dataDictionnary = [self readPropertyFile];
        NSMutableArray* tabAreas = [NSMutableArray arrayWithCapacity:[(dataDictionnary[@"areas"]) count]];
        for (int i=0; i<[(dataDictionnary[@"areas"]) count]; i++) {
            tabAreas[i] = [[PSArea alloc] initWithName:dataDictionnary[@"areas"][i]];
        }
        _areas = [[PSSetOfAreas alloc]initWithArray:tabAreas];
        NSMutableArray* tabTypes = [NSMutableArray arrayWithCapacity:[(dataDictionnary[@"types"]) count]];
        for (int i=0; i<[(dataDictionnary[@"types"]) count]; i++) {
            tabTypes[i] = [[PSArea alloc] initWithName:dataDictionnary[@"types"][i]];
        }
        _types = [[PSSetOfTypes alloc]initWithArray:tabTypes];
        NSMutableArray* tabDocs = [NSMutableArray arrayWithCapacity:[(dataDictionnary[@"documents"]) count]];
        for (int i=0; i<[(dataDictionnary[@"documents"]) count]; i++) {
            tabDocs[i] = [[PSDocument alloc] initWithName:(dataDictionnary[@"documents"][i])[@"name"]
                                                     type:[_types typeOfName:(dataDictionnary[@"documents"][i])[@"type"]]
                                                  andArea:[_areas areaOfName:(dataDictionnary[@"documents"][i])[@"area"]]];
        }
        _docs = [NSMutableSet setWithArray:tabDocs];
        _types = [[PSSetOfTypes alloc]initWithArray:tabTypes];
        _pools = [NSMutableSet setWithCapacity:20];
    }
    return self;
}


// base initializer with defaults documents, areas and types
// define for test purpose, in a final relaease should call the property initializer
- (id)init
{
    NSArray* tabAreas = @[[[PSArea alloc] initWithName:@"IG"],
                         [[PSArea alloc] initWithName:@"ERII"],
                         [[PSArea alloc] initWithName:@"Mat"],
                         [[PSArea alloc] initWithName:@"M&I"],
                         [[PSArea alloc] initWithName:@"STE"],
                         [[PSArea alloc] initWithName:@"STIA"],
                         [[PSArea alloc] initWithName:@"ENR"],
                         [[PSArea alloc] initWithName:@"MSI"],
                         [[PSArea alloc] initWithName:@"EGC"],
                         [[PSArea alloc] initWithName:@"SE"]];
    NSArray* tabTypes = @[[[PSType alloc] initWithName:@"URL"]];
    self = [super init];
    if (self) {
        _types = [[PSSetOfTypes alloc]initWithArray:tabTypes];
        _areas = [[PSSetOfAreas alloc]initWithArray:tabAreas];
        _docs  = [[NSMutableSet alloc] initWithArray:
                  @[[[PSDocument alloc] initWithName:@"Plaquette IG" type:[self.types typeOfName:@"URL"] andArea:[self.areas areaOfName:@"IG"]],
                   [[PSDocument alloc] initWithName:@"Syllabus IG" type:[self.types typeOfName:@"URL"] andArea:[self.areas areaOfName:@"IG"]],
                   [[PSDocument alloc] initWithName:@"Plaquette ERII" type:[self.types typeOfName:@"URL"] andArea:[self.areas areaOfName:@"ERII"]],
                   [[PSDocument alloc] initWithName:@"Syllabus ERII" type:[self.types typeOfName:@"URL"] andArea:[self.areas areaOfName:@"ERII"]],
                   [[PSDocument alloc] initWithName:@"Plaquette Mat" type:[self.types typeOfName:@"URL"] andArea:[self.areas areaOfName:@"Mat"]],
                   [[PSDocument alloc] initWithName:@"Syllabus M&I" type:[self.types typeOfName:@"URL"] andArea:[self.areas areaOfName:@"M&I"]]]];
        _pools = [NSMutableSet setWithCapacity:10];
    }
    return self;
}

// *************************************************************************************

// add a pool to this library
- (void) addPool:(PSPool *)pool{
    [self.pools addObject:pool];
}

@end
