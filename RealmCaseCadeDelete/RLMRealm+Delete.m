//
//  RLMRealm+Delete.m
//  RealmCaseCadeDelete
//
//  Created by FinderTiwk on 29/03/2017.
//  Copyright © 2017 FinderTiwk. All rights reserved.
//

#import "RLMRealm+Delete.h"
#import "RootObj.h"

@implementation RLMRealm (Delete)

- (void)deleteObject:(RootObj *)object {
    if ([object conformsToProtocol:@protocol(RealmCaseCadeDelete)]) {
        [object caseCadeDeleteInRealm:self];
    }
}

@end
