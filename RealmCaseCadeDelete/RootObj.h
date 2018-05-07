//
//  RootObj.h
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

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "RealmCaseCadeDelete.h"

#import "Level2ObjA.h"
#import "Level2ObjB.h"

@interface RootObj : RLMObject<RealmCaseCadeDelete>

@property NSString *idString;

@property RLMArray<Level2ObjA *><Level2ObjA> *list2A;

@property Level2ObjB *obj2B;

@end
