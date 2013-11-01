//
//  FloopSdkDelegate.h
//  floopsdk
//
//  Created by Vincent Côté-Roy on 13-05-03.
//  Copyright (c) 2013 Floop. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FloopSdkStatus.h"


@protocol FloopSdkDelegate <NSObject>

@optional
- (void)startupCompleted:(FloopSdkStatus)status
                   error:(NSError*)error
;

@optional
- (void)authenticationCompleted:(FloopSdkStatus)status
                          error:(NSError*)error
;

@optional
- (void)currentKidChanged;

@optional
- (void)loggedOut;

@end
