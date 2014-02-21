//
//  FloopSdkStatus.h
//  floopsdk
//
//  Copyright (c) 2013 Floop. All rights reserved.
//

/**
 * `FloopSdkStatus` represents the various states the sdk can be in.
 */
typedef enum {
    FloopSdkStatusNotInitialized,
    FloopSdkStatusInitializing,
    FloopSdkStatusInitializedWithoutAppKey,
    FloopSdkStatusLoggedOut,
    FloopSdkStatusWaitingForNetwork,
    FloopSdkStatusError,
    FloopSdkStatusLoggedIn,
}
FloopSdkStatus;

