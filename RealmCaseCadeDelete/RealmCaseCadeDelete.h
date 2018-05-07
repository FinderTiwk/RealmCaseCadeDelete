//
//  RealmCaseCadeDelete.h
//  RealmCaseCadeDelete
//
//  Created by FinderTiwk on 29/03/2017.
//  Copyright © 2017 FinderTiwk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RLMRealm;
@protocol RealmCaseCadeDelete <NSObject>

@required
- (void)caseCadeDeleteInRealm:(RLMRealm *)realm;

@end
