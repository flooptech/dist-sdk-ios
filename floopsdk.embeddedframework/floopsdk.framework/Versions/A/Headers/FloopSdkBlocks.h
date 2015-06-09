//
//  FloopSdkBlocks.h
//  floopsdk
//
//  Copyright (c) 2013 Floop. All rights reserved.
//
//
//   This header defines the blocks used throughout the SDK.
//

#import "FloopSdkStatus.h"

typedef void (^FloopStartCompletionBlock)(FloopSdkStatus status, NSError* error);
typedef void (^FloopParentalGateCompletionBlock)(BOOL success);
typedef void (^FloopWebFeatureCompletion)();
