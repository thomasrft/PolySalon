//
//  PSDataDocuments.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 14/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSArea.h"
#import "PSDocument.h"
#import "PSType.h"
#import "PSSetOfAreas.h"
#import "CFObserver.h"

@interface PSDataDocuments : NSObject<CFObserver>

//@property (nonatomic,weak) PSArea* areasSet;

@property (nonatomic,strong) NSArray* areas;
@property (nonatomic,strong) NSMutableArray* docsByAreas;

-(id) initWithAreas:(PSSetOfAreas*)aSetOfAreas;

-(PSArea*) getAreaForSection:(NSInteger)aSection;
-(PSDocument*) getDocumentForSection:(NSInteger) aSection andForRow:(NSInteger)aRow;
-(PSType*) getTypeForSection:(NSInteger)aSection andForRow:(NSInteger)aRow;

-(NSString*) getAreaNameForSection:(NSInteger)aSection;
-(NSString*) getDocumentNameForSection:(NSInteger) aSection andForRow:(NSInteger)aRow;
-(NSString*) getTypeNameForSection:(NSInteger)aSection andForRow:(NSInteger)aRow;

-(NSInteger) numberOfSections;
-(NSInteger) numberOfRowsForSection:(NSInteger)aSection;

@end
