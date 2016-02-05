//
//  FloopSdkManager.h
//  floopsdk
//
//  Copyright (c) 2013 Floop Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "FPLogLevel.h"
#import "FloopSdkStatus.h"
#import "FloopSdkBlocks.h"
#import "FloopAdView.h"

/**
 `FloopSdkManager` is the main class through which to use the Floop SDK.
 It should be always be accessed via the `sharedInstance` singleton instance.
 */
@interface FloopSdkManager : NSObject


/**
 `sharedInstance` is the singleton instance of `FloopSdkManager`.
 */
+ (FloopSdkManager*)sharedInstance;


/**
 `setLogLevel` controls the verbosity level of logging done by the sdk.
 */
+ (void)setLogLevel:(FPLogLevel)logLevel;

/** 
 Starts the sdk and begins syncing data with the server; this can only be called once.
*/
- (void)startWithAppKey:(NSString*)appKey;

/**
 Shows a parent gate, and invokes the completion with a boolean indicating success.
 */
- (void)showParentalGate:(FloopParentalGateCompletionBlock)completion;

/**
 * Video Ad
 */
- (void)showVideo:(FloopVideoHandler)completion;
- (BOOL)hasVideo;

/*
 Returns the current status of the SDK.
 */
@property (nonatomic,readonly) FloopSdkStatus currentStatus;


/**
 Returns a string version of the current status of the SDK.
 */
- (NSString*)currentStatusDescription;


- (void)showCrossPromotionPageWithName:(NSString *)name
                            completion:(FloopWebFeatureCompletion)completion
;


- (void)trackAppEvent:(NSString*)eventName
;

- (void)trackAppEvent:(NSString *)eventName
           parameters:(NSDictionary*)parameters
;

@end
