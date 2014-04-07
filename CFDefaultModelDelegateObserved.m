//
//  CFDefaultModelDelegateObserved.m
//  Observateur Design Pattern
//
//  Created by Fiorio Christophe on 11/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "CFDefaultModelDelegateObserved.h"

@implementation CFDefaultModelDelegateObserved

@synthesize delegate=_delegate;

- (id)init
{
    self = [super init];
    if (self) {
        _delegate = [[CFDefaultModelObserved alloc] init];
    }
    return self;
}

- (void)addObserver:(id<CFObserver>) observer{
    [self.delegate addObserver:observer];
}
- (void)removeObserver:(id<CFObserver>) observer{
    [self.delegate removeObserver:observer];
}
- (void)postNotification{
    [self.delegate postNotification:self];
}
- (void)postNotificationWithName:(NSString*)aName{
    [self.delegate postNotification:self withName:aName];
}

@end
