//
//  SampleAppTests.m
//  SampleAppTests
//
//  Created by Vincent Côté-Roy on 03/06/14.
//  Copyright (c) 2014 ABC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <floopsdk/floopsdk.h>

typedef void (^AsyncTestCompletion)();
typedef void (^AsyncTestBlock)(AsyncTestCompletion asyncCompletion);

@interface SampleAppTests : XCTestCase

@end

@interface TestNSOperation : NSOperation

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

-(void)testInit
{
    XCTAssertNotNil([FloopSdkManager sharedInstance]);
}

- (void)testStart
{
    
    [self doAsyncTest:^(AsyncTestCompletion asyncCompletion) {
        
        
        [[FloopSdkManager sharedInstance] startWithAppKey:@"6febd7e3514e4a4fac0cdb45d40e3d22"];
        
        [[FloopSdkManager sharedInstance] addStartupCompletionBlock:^(FloopSdkStatus status, NSError *error) {
            
            XCTAssertNotEqual(FloopSdkStatusError, status, @"Expected no error");
            XCTAssertNil(error, @"Expected no error, got %@", error);
            
            asyncCompletion();
        }];
    }];
    
}



- (void)doAsyncTest:(AsyncTestBlock)test
{
    __block BOOL done = NO;
    
    AsyncTestCompletion completion = ^{
        done = YES;
    };
    
    const NSTimeInterval maxElapsed = 3;
    const NSTimeInterval intervalCheck = 0.1;
    
    NSDate* start = [NSDate date];
    
    test(completion);
    
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



typedef void (^BoolBlock)(BOOL success);
typedef void (^VoidBlock)();
typedef void (^CompletionBlock)(id data, NSError* error);
typedef void (^WorkBlock)(CompletionBlock completion);
typedef void (^VoidCompletionBlock)();
typedef void (^VoidWorkBlock)(VoidCompletionBlock completion);



@interface TestNSOperation()

@property (strong,nonatomic) WorkBlock work;
@property (strong,nonatomic) CompletionBlock completion;


@property (nonatomic) BOOL wasStarted;
@property (nonatomic) BOOL isFinished;

@end

@implementation TestNSOperation

+ (TestNSOperation*)operationForWork:(WorkBlock)work
                                completion:(CompletionBlock)completion
{
    TestNSOperation* op = [[self alloc] init];
    op.work = work;
    op.completion = completion;
    return op;
}

- (void)start
{
    NSAssert(!self.wasStarted, @"already started");
    
    if(self.wasStarted)
    {
        return;
    }
    else
    {
        self.wasStarted = YES;
    }
    
    if ([self isCancelled])
    {
        [self setIsFinished:YES];
    }
    else
    {
        [self setIsFinished:NO];
        self.work(^(id data, id error){
            [self completeWithData:data error:error];
        });
    }
}

- (BOOL)isConcurrent
{
    return YES;
}

- (void)completeWithData:(id)data
                   error:(id)error
{
    [self setIsFinished:YES];
    if (self.completion)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.completion(data, error);
        });
    }
}

- (BOOL)isExecuting
{
    return !self.isFinished;
}


+(BOOL)automaticallyNotifiesObserversForKey:(NSString*)key
{
    return YES;
}



@end
