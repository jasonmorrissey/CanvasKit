//
//  CanvasPageView.m
//  CanvasKit
//
//  Created by JM on 15/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CanvasPageView.h"
#import "CanvasTileView.h"
#import "CanvasView.h"

@interface CanvasPageView()

- (void) notifyTilesBeforeDealloc;

@end


@implementation CanvasPageView

@synthesize pageIndex;


- (id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) 
	{
        // Initialization code.
		self.backgroundColor = [UIColor clearColor];
		self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return self;
}


- (void) updateTiles;
{
	[self notifyTilesBeforeDealloc];
	
	CanvasView * canvasView = (CanvasView *) [[self superview] superview];
	
	int numPlaceholderTilesRequired = [CanvasView tilesPerPage];
	
	for (UIView * subview in self.subviews)
	{
		[subview removeFromSuperview];
	}

	long startIndex = [CanvasView tilesPerPage] * self.pageIndex;
	for (long tileIndex = startIndex; tileIndex < [CanvasView tilesPerPage] + startIndex; tileIndex++)
	{
		CanvasTileView * tileView = [canvasView.datasource tileViewForIndex:tileIndex];
		if (tileView)
		{
			tileView.tileIndex = tileIndex;
			[self addSubview:tileView];
			numPlaceholderTilesRequired--;
		}
	}
	
//	[self setNeedsDisplay];
}

- (BOOL) isOnscreen
{
	CanvasView * canvasView = (CanvasView *) [[self superview] superview];
	return (self.pageIndex == canvasView.page);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect 
//{
//    // Drawing code.
//	[[NSString stringWithFormat:@"%d",self.pageIndex] drawAtPoint:CGPointMake(0, 0) withFont:[UIFont systemFontOfSize:11]];
//}

- (void) notifyTilesBeforeDealloc;
{
	for (CanvasTileView * tileView in self.subviews)
	{
		[tileView tileWillDealloc];
	}
}

- (void)dealloc 
{
//	NSLog(@"[ - - - - ] canvasPageView dealloc in for page (%d)", self.pageIndex);
	[self notifyTilesBeforeDealloc];
    [super dealloc];
}


@end
