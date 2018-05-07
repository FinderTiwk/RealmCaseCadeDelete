//
//  RootObj.m
//  RealmCaseCadeDelete
//
//  _____  _           _          _____ _          _
//  |  ___(_)_ __   __| | ___ _ _|_   _(_)_      _| | __
//  | |_  | | '_ \ / _` |/ _ \ '__|| | | \ \ /\ / / |/ /
//  |  _| | | | | | (_| |  __/ |   | | | |\ V  V /|   <
//  |_|   |_|_| |_|\__,_|\___|_|   |_| |_| \_/\_/ |_|\_\
//
//  Created by FinderTiwk on 29/03/2017.
//  Copyright © 2017 FinderTiwk. All rights reserved.
//

#import "RootObj.h"

@implementation RootObj

+ (NSString *)primaryKey{
    return @"idString";
}

- (void)caseCadeDeleteInRealm:(RLMRealm *)realm{

    [realm deleteObjects:self.list2A];
    
    if ([self.obj2B conformsToProtocol:@protocol(RealmCaseCadeDelete)]) {
        [self.obj2B caseCadeDeleteInRealm:realm];
    }
    
    [realm deleteObject:self.obj2B];
    
}

@end
