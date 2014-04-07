//
//  CFModelObserved.h
//  Observateur Design Pattern
//
//  Created by Fiorio Christophe on 11/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFObserver.h"

@protocol CFModelObserved <NSObject>
- (void)addObserver:(id<CFObserver>) observer;
- (void)removeObserver:(id<CFObserver>) observer;
- (void)postNotification;
- (void)postNotificationWithName:(NSString*)aName;
@optional
- (void)postNotification:(id)source;
- (void)postNotification:(id)source withName:(NSString*)aName;
@end
