//
//  FloopSdkBlocks.h
//  floopsdk
//
//  Created by Vincent Côté-Roy on 13-05-06.
//  Copyright (c) 2013 Floop. All rights reserved.
//

#import "FloopSdkStatus.h"


typedef void (^FloopStartCompletionBlock)(FloopSdkStatus status, NSError* error);
typedef void (^FloopAuthCompletionBlock)(FloopSdkStatus status, NSError* error);
typedef void (^FloopSharingCompletionBlock)(BOOL success, NSError* error);
