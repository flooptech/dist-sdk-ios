//
//  FPLogLevel.h
//  floopsdk
//
//  Created by Vincent Côté-Roy on 13-07-26.
//  Copyright (c) 2013 Floop. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * `FPLogLevel` represents the logging verbosity level.
 */
typedef enum
{
    FPLogLevelDebug,
    FPLogLevelInfo,
    FPLogLevelWarn,
    FPLogLevelError,
    FPLogLevelFatal, 
    FPLogLevelNone,
}
FPLogLevel;
