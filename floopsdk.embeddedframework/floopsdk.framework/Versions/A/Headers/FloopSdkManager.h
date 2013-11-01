//
//  FloopSdkManager.h
//  floopsdk
//
//  Created by Vincent Côté-Roy on 13-07-22.
//  Copyright (c) 2013 Floop. All rights reserved.
//

#import <Foundation/Foundation.h>



#import "FPLogLevel.h"
#import "FloopSdkStatus.h"
#import "FloopSdkBlocks.h"



@interface FloopResult

@property (nonatomic) FloopSdkStatus status;
@property (nonatomic,strong) NSError* error;


@end



@interface FloopSdkManager : NSObject

+ (FloopSdkManager*)sharedInstance;

+ (void)setLogLevel:(FPLogLevel)logLevel;

//starts the sdk and syncs data with server; this can only be called once
- (void)startWithAppID:(NSString*)appID;

//to improve visual integration with your app, plug this into your "loading" routine
//if you want to avoid another wait screen when showing the auth screen
- (void)addStartupCompletionBlock:(FloopStartCompletionBlock)block;

//show login screen if not authenticated, or account status screen with logout button otherwise
- (void)showAuthScreenAnimated:(BOOL)animated
                    completion:(FloopAuthCompletionBlock)completion
;

//show login screen if not authenticated, or account status screen with logout button otherwise; this version assumes a coppa-compliant parent gate has already been shown
- (void)showAuthScreenWithoutParentGateAnimated:(BOOL)animated
                                     completion:(FloopAuthCompletionBlock)completion
;


- (void)shareImage:(UIImage*)image
        completion:(FloopSharingCompletionBlock)completion
;




@property (nonatomic,readonly) FloopSdkStatus currentStatus;

- (NSString*)currentStatusDescription;

@property (nonatomic,readonly) BOOL loggedIn;

@end
