//
//  IRInnerShadowedView.h
//  iridia-IRInnerShadowedView
//
//  Created by Evadne Wu on 6/21/10.
//  Copyright 2010 Iridia Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CGGeometry+IRFittingAdditions.h"





@interface IRInnerShadowedView : UIView {

	CGFloat irShadowSpread;
	CGSize irShadowOffset;
	UIColor *irShadowColor;

	CGFloat irInnerBorderWidth;
	UIColor *irInnerBorderColor;

}





@property (assign) CGFloat irShadowSpread;
@property (assign) CGSize irShadowOffset;
@property (retain) UIColor *irShadowColor;

@property (assign) CGFloat irInnerBorderWidth;
@property (retain) UIColor *irInnerBorderColor;





@end




