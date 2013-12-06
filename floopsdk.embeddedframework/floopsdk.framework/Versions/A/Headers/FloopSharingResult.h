//
//  FloopSharingResult.h
//  floopsdk
//
//  Copyright (c) 2013 Floop. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * `FloopSharingResult` is the object returned in a shareImage completion.
 */
@interface FloopSharingResult : NSObject

/*
 The method used for sharing. For now returns "floop".
 */
@property (strong,nonatomic,readonly) NSString* methodDescription;

/*
 Whether the image was actually sent.
 */
@property (nonatomic,readonly) bool success;

@end
