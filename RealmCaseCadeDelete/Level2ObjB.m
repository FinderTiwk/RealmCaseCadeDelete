//
//  Level2ObjB.m
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

#import "Level2ObjB.h"

@implementation Level2ObjB

- (void)caseCadeDeleteInRealm:(RLMRealm *)realm{
    
    for (Level3ObjA *obj in self.list3A) {
        if ([obj conformsToProtocol:@protocol(RealmCaseCadeDelete)]) {
            [obj caseCadeDeleteInRealm:realm];
        }
        [realm deleteObject:obj];
    }
}

@end
