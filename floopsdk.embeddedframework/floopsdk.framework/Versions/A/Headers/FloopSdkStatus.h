//
//  FloopSdkStatus.h
//  floopsdk
//
//  Created by Vincent Côté-Roy on 13-07-08.
//  Copyright (c) 2013 Floop. All rights reserved.
//


typedef enum {
    FloopSdkStatusNotInitialized,
    FloopSdkStatusInitializing,
    FloopSdkStatusLoggedOut,
    FloopSdkStatusWaitingForNetwork,
    FloopSdkStatusError,
    FloopSdkStatusLoggedIn,
}
FloopSdkStatus;

