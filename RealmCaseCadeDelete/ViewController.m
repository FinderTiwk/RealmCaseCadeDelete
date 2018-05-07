//
//  ViewController.m
//  RealmCaseCadeDelete
//
//  Created by FinderTiwk on 29/03/2017.
//  Copyright © 2017 FinderTiwk. All rights reserved.
//

#import "ViewController.h"
#import "RealmBrige.h"
#import "Level2ObjA.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name ENDSWITH[cd] %@",@"-8"];
    
    RLMRealm *realm = [RealmBrige mainRealm];
    RLMResults<Level2ObjA *> *result = [Level2ObjA objectsInRealm:realm withPredicate:predicate];
    NSUInteger index = 0;
    for (Level2ObjA *obj in result) {
        NSLog(@"%lu--%@",(unsigned long)++index,obj.name);
    }
}

- (IBAction)genMockData:(UIButton *)sender {
    [RealmBrige mockData];
}

- (IBAction)caseCadeDelete:(UIButton *)sender {
    
    RLMRealm *realm = [RealmBrige mainRealm];
    RLMResults<RootObj *> *resuslts = [RootObj allObjectsInRealm:realm];

    [realm beginWriteTransaction];
    
    for (RootObj *obj in resuslts) {
        [obj caseCadeDeleteInRealm:realm];
        [realm deleteObject:obj];
    }

    [realm commitWriteTransaction];
    
        

}


@end
