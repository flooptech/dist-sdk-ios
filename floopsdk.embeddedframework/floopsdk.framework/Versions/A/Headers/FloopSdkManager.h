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
 Shows a parent gate if necessary, and invokes the completion with a boolean indicating success.

 When exiting the parent zone, `exitParentZone` must be called.
 
 The parent zone works as a stack, the parent gate appearing when the stack is empty.
 
 */
- (void)enterParentZone:(FloopParentalGateCompletionBlock)completion;

/**
 
 Exit the current parent zone.

 */
- (void)exitParentZone;



/**
 Shows the login screen if not authenticated, or an account status screen with logout button otherwise.
 */
- (void)showAuthScreenAnimated:(BOOL)animated
                    completion:(FloopAuthCompletionBlock)completion;

/**
 Show the login screen if not authenticated, or an account status screen with logout button otherwise. 
 This version assumes a coppa-compliant parent gate has already been shown.
*/
- (void)showAuthScreenWithoutParentGateAnimated:(BOOL)animated
                                     completion:(FloopAuthCompletionBlock)completion;

/**
 Tries to share image via Floop. If not authenticated, first a parent gate is shown, and then the login screen.
 */
- (void)shareImage:(UIImage*)image
        completion:(FloopSharingCompletionBlock)completion;

/**
 Returns the current status of the SDK.
 */
@property (nonatomic,readonly) FloopSdkStatus currentStatus;


/**
 Returns a string version of the current status of the SDK.
 */
- (NSString*)currentStatusDescription;

/**
 
 Returns whether the SDK is in the loggedIn state.
 
 */
@property (nonatomic,readonly) BOOL loggedIn;

- (void)showCrossPromotionPageWithName:(NSString *)name
                            completion:(FloopCrossPromotionCompletion)completion
;

@end
