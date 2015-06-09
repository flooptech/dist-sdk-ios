//
//  FloopWebFeatureButton.h
//  floopsdk
//
//  Created by Vincent Côté-Roy on 28/07/14.
//  Copyright (c) 2014 Floop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FloopWebFeatureButton : UIButton

@property (strong,nonatomic) NSString* funnelName;

- (void)setup;

@end
