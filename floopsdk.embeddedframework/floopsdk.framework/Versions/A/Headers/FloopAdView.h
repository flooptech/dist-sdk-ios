//
//  FloopAdView.h
//  floopsdk
//
//  Created by Vincent Côté-Roy on 21/02/14.
//  Copyright (c) 2014 Floop. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    
    FloopPlacementAnchorManual,
    
    FloopPlacementAnchorTopLeft,
    FloopPlacementAnchorTopCenter,
    FloopPlacementAnchorTopRight,
    
    FloopPlacementAnchorBottomLeft,
    FloopPlacementAnchorBottomCenter,
    FloopPlacementAnchorBottomRight,
    
}
FloopPlacementAnchor;


@interface FloopAdView : UIView

@property (strong,nonatomic) NSString* adUnitID;
@property (nonatomic) FloopPlacementAnchor anchor;
@property (nonatomic) NSInteger maximumHeight;
@property (nonatomic) BOOL flipOrientation;

@end
