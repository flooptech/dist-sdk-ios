//
//  FloopSdkManager+Internal.h
//  floopsdk
//
//  Created by Vincent Côté-Roy on 05/02/14.
//  Copyright (c) 2014 Floop. All rights reserved.
//

#import <floopsdk/floopsdk.h>

#import "FloopSdkManager.h"
@class  FPWebFeature;

@interface FloopSdkManager (Private)


- (void)showWebFeature:(FPWebFeature*)webFeature
            completion:(FloopWebFeatureCompletion)completion
;

 
- (void)setupTestScheduler:(int)type
;

@end
