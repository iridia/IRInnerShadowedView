//
//  IRInnerShadowedView.m
//  iridia-IRInnerShadowedView
//
//  Created by Evadne Wu on 6/21/10.
//  Copyright 2010 Iridia Productions. All rights reserved.
//





#import "IRInnerShadowedView.h"





@implementation IRInnerShadowedView
@synthesize irShadowSpread, irShadowOffset, irShadowColor;





- (IRInnerShadowedView *) initWithFrame:(CGRect)frame {

	IRInnerShadowedView *theView = [super initWithFrame:frame];
	if (theView == nil) return nil;
	
	theView.irShadowColor = nil;
	theView.irShadowOffset = CGSizeZero;
	theView.irShadowSpread = 0.0f;
	
	return theView;

}





- (void) drawRect:(CGRect)rect {

	if (self.irShadowSpread == 0) return;
	if (self.irShadowColor == nil) return;

	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);

	CGPathRef offsetPathRef = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(
	
		IRCGRectMoveToPoint(self.frame, CGPointZero), 
		(-0.5 * self.irShadowSpread), 
		(-0.5 * self.irShadowSpread)
		
	) cornerRadius:(self.layer.cornerRadius * sqrt(1.5))].CGPath;
	
	CGContextSetStrokeColorWithColor(context, self.irShadowColor.CGColor);
	CGContextSetShadowWithColor(context, CGSizeZero, self.irShadowSpread, self.irShadowColor.CGColor);
	CGContextSetLineWidth(context, self.irShadowSpread);
	
	CGContextAddPath(context, offsetPathRef);
	CGContextStrokePath(context);
	
	CGContextAddPath(context, offsetPathRef);
	CGContextStrokePath(context);
	
	CGContextRestoreGState(context);

}





- (void) dealloc {

	[self.irShadowColor release];
	[super dealloc];

}





@end




