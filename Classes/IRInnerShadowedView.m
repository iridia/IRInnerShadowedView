//
//  IRInnerShadowedView.m
//  iridia-IRInnerShadowedView
//
//  Created by Evadne Wu on 6/21/10.
//  Copyright 2010 Iridia Productions. All rights reserved.
//





#import "IRInnerShadowedView.h"





@interface IRInnerShadowedView (Private)

- (void) configure;
- (void) drawInnerShadow;
- (void) drawInnerBorder;

@end





@implementation IRInnerShadowedView
@synthesize irShadowSpread, irShadowOffset, irShadowColor;
@synthesize irInnerBorderWidth, irInnerBorderColor;





- (IRInnerShadowedView *) initWithCoder:(NSCoder *)aDecoder {

	IRInnerShadowedView *theView = [super initWithCoder:aDecoder];
	if (theView == nil) return nil;

	[theView configure];
	
	return theView;

}





- (IRInnerShadowedView *) initWithFrame:(CGRect)frame {

	IRInnerShadowedView *theView = [super initWithFrame:frame];
	if (theView == nil) return nil;
	
	[theView configure];
	
	return theView;

}





- (void) configure {

	self.irShadowColor = nil;
	self.irShadowOffset = CGSizeZero;
	self.irShadowSpread = 0.0f;
	
	self.irInnerBorderColor = nil;
	self.irInnerBorderWidth = 0.0f;
	
}





- (void) drawRect:(CGRect)rect {

	[self drawInnerShadow];
	[self drawInnerBorder];

}





- (void) drawInnerShadow {

	if (self.irShadowSpread == 0) return;
	if (self.irShadowColor == nil) return;

	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);

	CGPathRef offsetPathRef = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(
	
		IRCGRectMoveToPoint(self.frame, CGPointZero), 
		(-0.5f * self.irShadowSpread), 
		(-0.5f * self.irShadowSpread)
		
	) cornerRadius:(CGFloat)(self.layer.cornerRadius * sqrt(1.5))].CGPath;
	
	CGContextSetStrokeColorWithColor(context, self.irShadowColor.CGColor);
	CGContextSetShadowWithColor(context, CGSizeZero, self.irShadowSpread, self.irShadowColor.CGColor);
	CGContextSetLineWidth(context, self.irShadowSpread);
	
	CGContextAddPath(context, offsetPathRef);
	CGContextStrokePath(context);

	CGContextRestoreGState(context);

}





- (void) drawInnerBorder {

	if (self.irInnerBorderWidth == 0) return;
	if (self.irInnerBorderColor == nil) return;

	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);

	CGPathRef offsetPathRef = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(
	
		IRCGRectMoveToPoint(self.frame, CGPointZero), 
		(0.5f * self.irInnerBorderWidth), 
		(0.5f * self.irInnerBorderWidth)
		
	) cornerRadius:MAX(0.0f, (CGFloat)(self.layer.cornerRadius - 0.5 * self.irInnerBorderWidth))].CGPath;

	
	CGContextSetLineWidth(context, self.irInnerBorderWidth);
	
	CGContextAddPath(context, offsetPathRef);
	CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
	CGContextSetBlendMode(context, kCGBlendModeClear);
	CGContextStrokePath(context);
	
	CGContextAddPath(context, offsetPathRef);
	CGContextSetStrokeColorWithColor(context, self.irInnerBorderColor.CGColor);
	CGContextSetBlendMode(context, kCGBlendModeNormal);
	CGContextStrokePath(context);

	CGContextRestoreGState(context);

}





- (void) dealloc {

	[self.irShadowColor release];
	[super dealloc];

}





@end




