//
//  SampleAppTests.m
//  SampleAppTests
//
//  Created by Vincent Côté-Roy on 03/06/14.
//  Copyright (c) 2014 ABC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <floopsdk/floopsdk.h>

@interface SampleAppTests : XCTestCase

@end

@implementation SampleAppTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testStart
{
    __block BOOL done = NO;
    
    [FloopSdkManager setLogLevel:FPLogLevelDebug];
    
    [[FloopSdkManager sharedInstance] startWithAppKey:@"6febd7e3514e4a4fac0cdb45d40e3d22"];
    
    [[FloopSdkManager sharedInstance] addStartupCompletionBlock:^(FloopSdkStatus status, NSError *error) {
        
        XCTAssertEqual(FloopSdkStatusLoggedOut, status, @"Expected status %d, got %d", FloopSdkStatusLoggedOut, status);
        XCTAssertNil(error, @"Expected no error, got %@", error);
        
        //        [self notify:kXCTUnitWaitStatusSuccess];
        done = YES;
    }];
    
    
    const NSTimeInterval maxElapsed = 3;
    const NSTimeInterval intervalCheck = 0.1;
    
    NSDate* start = [NSDate date];
    
    @autoreleasepool {
        
        while (!done && [[NSDate date] timeIntervalSinceDate:start] < maxElapsed)
        {
            if (![[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                          beforeDate:[NSDate dateWithTimeIntervalSinceNow:intervalCheck]])
            {
                // If there were no run loop sources or timers then we should sleep for the interval
                [NSThread sleepForTimeInterval:intervalCheck];
            }
        }
        XCTAssertTrue(done, @"test timed out");
        
    }
    
    
    
}



@end
