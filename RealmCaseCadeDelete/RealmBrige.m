//
//  RealmBrige.m
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

#import "RealmBrige.h"

#import "Level2ObjA.h"
#import "Level2ObjB.h"
#import "Level3ObjA.h"
#import "Level4ObjA.h"

@implementation RealmBrige

/*! 支付数据库*/
static NSString *const XKS_PaymentRealm = @"XKS_RealmCaseCadeDelete";
static RLMRealmConfiguration *__customConfig;
+ (void)initialize{
    
    RLMRealmConfiguration *defaultConfig = [RLMRealmConfiguration defaultConfiguration];
    __customConfig = [[RLMRealmConfiguration alloc] init];
    
    __customConfig.fileURL = [[[defaultConfig.fileURL URLByDeletingLastPathComponent] URLByAppendingPathComponent:XKS_PaymentRealm] URLByAppendingPathExtension:@"realm"];
    
    NSString *folderPath = __customConfig.fileURL.URLByDeletingLastPathComponent.path;
    NSLog(@"DBPath-->%@",folderPath);
    // 解除这个目录的保护,应用退出后台时也可访问此数据库
    [[NSFileManager defaultManager] setAttributes:@{NSFileProtectionKey: NSFileProtectionNone} ofItemAtPath:folderPath error:nil];
    
    __customConfig.objectClasses = @[NSClassFromString(@"RootObj"),
                                     NSClassFromString(@"Level2ObjA"),
                                     NSClassFromString(@"Level2ObjB"),
                                     NSClassFromString(@"Level3ObjA"),
                                     NSClassFromString(@"Level4ObjA")];
}

+ (RLMRealm *)mainRealm{
    return [RLMRealm realmWithConfiguration:__customConfig error:NULL];
}


+ (void)mockData{
    RLMRealm *realm = [self mainRealm];
    [realm beginWriteTransaction];

    for (NSUInteger index = 0; index < 10; index ++) {
        NSString *randomIDString = getXUUID();
        RootObj *root = [[RootObj alloc] init];
        root.idString = randomIDString;
        
        for (NSUInteger j = 0; j < 20; j++) {
            Level2ObjA *obj2A = [[Level2ObjA alloc] init];
            obj2A.name = [NSString stringWithFormat:@"%@-%lu-%lu",randomIDString,(unsigned long)index,(unsigned long)j];
            [root.list2A addObject:obj2A];
        }
        
        Level2ObjB *obj2B = [[Level2ObjB alloc] init];
        for (NSUInteger j = 0; j < 15; j++) {
            Level3ObjA *obj3A = [[Level3ObjA alloc] init];
            obj3A.name = [NSString stringWithFormat:@"%@-%lu-%lu",randomIDString,(unsigned long)index,(unsigned long)j];
            
            Level4ObjA *obj4A = [[Level4ObjA alloc] init];
            obj4A.name = [NSString stringWithFormat:@"%@-%lu",randomIDString,(unsigned long)j];

            obj3A.obj4A = obj4A;
            
            [obj2B.list3A addObject:obj3A];
        }
                
        root.obj2B = obj2B;
        [RootObj createOrUpdateInRealm:realm withValue:root];
    }
    [realm commitWriteTransaction];
}


NSString* getXUUID(){
    CFUUIDRef cfUUID = CFUUIDCreate(nil);
    CFStringRef cfUUIDString = CFUUIDCreateString(nil, cfUUID);
    NSString * result = (__bridge_transfer NSString *)CFStringCreateCopy(NULL, cfUUIDString);
    CFRelease(cfUUID);
    CFRelease(cfUUIDString);
    return [[result stringByReplacingOccurrencesOfString:@"-" withString:@""] lowercaseString];
}
@end
