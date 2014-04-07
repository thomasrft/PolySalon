//
//  CFDefaultModelObserved.m
//  Observateur Design Pattern
//
//  Created by Fiorio Christophe on 11/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "CFDefaultModelObserved.h"

@implementation CFDefaultModelObserved

@synthesize observerSet=_observerSet;

- (id)init
{
    self = [super init];
    if (self) {
        _observerSet = [NSMutableSet setWithCapacity:3];
    }
    return self;
}
- (void)addObserver:(id<CFObserver>) observer{
    [self.observerSet addObject:observer];
}
- (void)removeObserver:(id<CFObserver>) observer{
    [self.observerSet removeObject:observer];
}
- (void)postNotification{
    for (id observer in self.observerSet) {
        if([observer respondsToSelector:@selector(changeIn:)])  [observer changeIn:self];
    }
}
- (void)postNotificationWithName:(NSString*)aName{
    for (id observer in self.observerSet) {
        if([observer respondsToSelector:@selector(changeIn:withName:)]){
            [observer changeIn:self withName:aName];
        }
        else{
            if([observer respondsToSelector:@selector(changeIn:)])  [observer changeIn:self];
        }
    }
}
- (void)postNotification:(id)source{
    for (id observer in self.observerSet) {
        if([observer respondsToSelector:@selector(changeIn:)])  [observer changeIn:source];
    }
}
- (void)postNotification:(id)source withName:(NSString*)aName{
    for (id observer in self.observerSet) {
        if([observer respondsToSelector:@selector(changeIn:withName:)]){
            [observer changeIn:source withName:aName];
        }
        else{
            if([observer respondsToSelector:@selector(changeIn:)])  [observer changeIn:source];
        }
    }
}
@end
