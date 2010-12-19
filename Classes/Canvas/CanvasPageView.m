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

@implementation CanvasPageView

@synthesize pageIndex;

- (id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) 
	{
        // Initialization code.
		self.backgroundColor = [UIColor grayColor];
		self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return self;
}


- (void) updateTiles;
{
	CanvasView * canvasView = (CanvasView *) [[self superview] superview];
	
	
	int numPlaceholderTilesRequired = [CanvasView tilesPerPage];
	
	for (UIView * subview in self.subviews)
	{
		[subview removeFromSuperview];
	}

	long startIndex = [CanvasView tilesPerPage] * self.pageIndex;
	NSLog(@"updating tiles for page: %d", self.pageIndex);
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
	
//	if (self.pageIndex >= 0)
//	{
//		NSArray * pageTileDictionaries = [datasource tileDictionariesInRange:NSMakeRange([CanvasView tilesPerPage] * self.pageIndex, [CanvasView tilesPerPage])];
//		for (NSDictionary * tileDictionary in pageTileDictionaries)
//		{
//			int tileIndex = [[tileDictionary objectForKey:@"tileIndex"] intValue];
//			CanvasTileView * tileView = [[CanvasTileView alloc] initWithFrame:[CanvasView rectForTileAtIndex:tileIndex]];
//			tileView.tileDictionary = tileDictionary;
//			[self addSubview:tileView];
//			numPlaceholderTilesRequired--;
//		}
//	}
	
// draw placeholders for missing tiles
//	for (int tileIndex=1; tileIndex <= numPlaceholderTilesRequired; tileIndex++)
//	{
//		CanvasTileView * tileView = [[CanvasTileView alloc] initWithFrame:[CanvasView rectForTileAtIndex:[CanvasView tilesPerPage] - tileIndex]];
//		tileView.alpha = 0.2;
//		[self addSubview:tileView];
//	}
	
	
	[self setNeedsDisplay];

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect 
{
    // Drawing code.
	[[NSString stringWithFormat:@"%d",self.pageIndex] drawAtPoint:CGPointMake(0, 0) withFont:[UIFont systemFontOfSize:11]];
}

- (void)dealloc 
{
    [super dealloc];
}


@end
