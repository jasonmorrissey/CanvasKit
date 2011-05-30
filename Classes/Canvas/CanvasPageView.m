//  Created by Jason Morrissey

#import "CanvasPageView.h"
#import "CanvasTileView.h"
#import "CanvasView.h"

@interface CanvasPageView()
- (void) notifyTilesBeforeRelease;
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
	[self notifyTilesBeforeRelease];
	
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
}

- (BOOL) isOnscreen
{
	CanvasView * canvasView = (CanvasView *) [[self superview] superview];
	return (self.pageIndex == canvasView.page);
}

- (void) notifyTilesBeforeRelease;
{
	for (CanvasTileView * tileView in self.subviews)
	{
		[tileView tileWillRelease];
	}
}

- (void)dealloc 
{
	[self notifyTilesBeforeRelease];
    [super dealloc];
}


@end
