//
//  ViewController.m
//  Floop Sample App
//
//  Created by Floop on 2015-08-28.
//  Copyright (c) 2015 floop technologies. All rights reserved.
//

#import "ViewController.h"
#import <floopsdk/FloopSdkManager.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)testHasVideo:(id)sender
{
    BOOL videoReady = [[FloopSdkManager sharedInstance] hasVideo];
    
    NSString* message = [NSString stringWithFormat:@"HASVIDEOTEST SAYS : %@",
                         (videoReady) ? @"YES" : @"NO"
                         ];
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"test hasVideo"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil
                          ];
    [alert show];
}

- (IBAction)videoview:(id)sender {
    if([[FloopSdkManager sharedInstance] hasVideo]){
        [[FloopSdkManager sharedInstance] showVideo:^(BOOL completed, BOOL clicked) {
            NSString* message = [NSString stringWithFormat:@"Video is completed=%@, clicked=%@",
                                 completed ? @"YES" : @"NO", clicked ? @"YES":@"NO"
                                 ];
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"ShowVideo Callback"
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil
                                  ];
            [alert show];
        }];
    }
}

-(IBAction)parentalgatebtn:(id)sender
{
    [[FloopSdkManager sharedInstance] showParentalGate:^(BOOL success) {
        NSString* message = [NSString stringWithFormat:@"showParentalGate returned with: %@",
                             (success) ? @"YES" : @"NO"
                             ];
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Parental Gate"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil
                              ];
        [alert show];
         
    }];
}



@end
