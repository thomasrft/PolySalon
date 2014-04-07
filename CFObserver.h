//
//  Oberver_Design_Pattern.h
//  Oberver Design Pattern
//
//  Created by Fiorio Christophe on 11/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CFObserver <NSObject>
- (void)changeIn:(id)source;
@optional
- (void)changeIn:(id)source withName:(NSString*)aName;
@end
