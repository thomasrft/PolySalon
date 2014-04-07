//
//  CFDefaultModelDelegateObserved.h
//  Observateur Design Pattern
//
//  Created by Fiorio Christophe on 11/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFDefaultModelObserved.h"

@interface CFDefaultModelDelegateObserved : NSObject <CFModelObserved>

@property (nonatomic,strong) CFDefaultModelObserved* delegate;

- (id) init;
- (void)addObserver:(id<CFObserver>) observer;
- (void)removeObserver:(id<CFObserver>) observer;
- (void)postNotification;
- (void)postNotificationWithName:(NSString*)aName;

@end
