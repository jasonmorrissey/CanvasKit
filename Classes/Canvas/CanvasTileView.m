//
//  CanvasTileView.m
//  CanvasKit
//
//  Created by D on 16/12/10.
//  Copyright 2010 The Design Shed. All rights reserved.
//

#import "CanvasTileView.h"
#import "CanvasView.h"

@interface CanvasTileView()
@end


@implementation CanvasTileView

@synthesize tileDictionary = tileDictionary_;
@synthesize highlighted = highlighted_;
@synthesize selected = selected_;
@synthesize tileIndex = tileIndex_;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesBegan:touches withEvent:event];
	self.highlighted = YES;	
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesMoved:touches withEvent:event];
	self.highlighted = NO;
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesCancelled:touches withEvent:event];	
	self.highlighted = NO;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesEnded:touches withEvent:event];
	self.highlighted = NO;
	self.selected = !self.selected;
	
	[(id)[self canvasControlDelegate] performSelector:@selector(canvasViewDidTapTileView:) withObject:self];
}

- (void) setSelected:(BOOL) isSelected
{
	selected_ = isSelected;
	[self setNeedsDisplay];
}

- (void) setHighlighted:(BOOL) isHighlighted
{
	highlighted_ = isHighlighted;
	[self setNeedsDisplay];
}

- (id<CanvasViewDelegateProtocol>) canvasControlDelegate;
{
	CanvasView * canvasView = (CanvasView *) [[[self superview] superview] superview];
	return canvasView.canvasControlDelegate;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	NSString * ident = [self.tileDictionary objectForKey:@"ident"];
	if (self.highlighted)
	{
		[ident drawAtPoint:CGPointMake(5, 5) withFont:[UIFont boldSystemFontOfSize:10]];
	}
	else 
	{
		[ident drawAtPoint:CGPointMake(5, 5) withFont:[UIFont systemFontOfSize:10]];		
	}

}

- (BOOL) isOnscreen
{
	CanvasPageView * canvasPageView = (CanvasPageView *) [self superview];
	return [canvasPageView isOnscreen];
}

- (BOOL) isDragging
{
	CanvasView * canvasView = (CanvasView *) [[[self superview] superview] superview];
	return canvasView.isDragging;
}

- (void) tileWillDealloc;
{
	// called from CanvasPageView
	// can be used to flush any NSTimers or other retaining objects
}

- (void)dealloc {
	self.tileDictionary = nil;
    [super dealloc];
}


@end
