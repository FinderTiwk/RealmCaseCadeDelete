//
//  Level2ObjB.h
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

#import <Realm/Realm.h>
#import "RealmCaseCadeDelete.h"
#import "Level3ObjA.h"

@interface Level2ObjB : RLMObject<RealmCaseCadeDelete>

@property NSString *name;

@property RLMArray<Level3ObjA *><Level3ObjA> *list3A;


@end
