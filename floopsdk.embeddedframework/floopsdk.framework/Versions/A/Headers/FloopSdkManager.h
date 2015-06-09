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



@interface FloopResult

@property (nonatomic) FloopSdkStatus status;
@property (nonatomic,strong) NSError* error;


@end



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
 Adds a block to be invoked when the startup server synchronization is completed.
 If the startup process has already completed, the block is invoked immediately.
 */
- (void)addStartupCompletionBlock:(FloopStartCompletionBlock)block;


/**
 Shows a parent gate, and invokes the completion with a boolean indicating success.
 */
- (void)showParentalGate:(FloopParentalGateCompletionBlock)completion;

/**
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

- (FloopAdView*)showAdUnitWithID:(NSString*)floopAdUnitID
                   maximumHeight:(NSInteger)maxHeight
                          anchor:(FloopPlacementAnchor)anchor
                       superview:(UIView *)superview
;

@end
