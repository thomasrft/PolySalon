//
//  CFDefaultModelObserved.h
//  Observateur Design Pattern
//
//  Created by Fiorio Christophe on 11/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFModelObserved.h"

@interface CFDefaultModelObserved : NSObject <CFModelObserved>
@property (nonatomic,strong) NSMutableSet* observerSet;

- (id) init;
- (void)addObserver:(id<CFObserver>) observer;
- (void)removeObserver:(id<CFObserver>) observer;
- (void)postNotification;
- (void)postNotificationWithName:(NSString*)aName;
- (void)postNotification:(id)source;
- (void)postNotification:(id)source withName:(NSString*)aName;
@end
