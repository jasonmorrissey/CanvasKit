//  Created by Jason Morrissey

#import "DemoViewController.h"

@interface DemoViewController()
@property (nonatomic, retain) NSMutableArray * items;
- (void)addRandomTileDictionaries;
@end

@implementation DemoViewController

@synthesize items = items_;

- (void)dealloc
{
    self.items = nil;
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
	{
		items_ = [[NSMutableArray alloc] init];
        [self addRandomTileDictionaries];
    }
    return self;
}

- (void) addRandomTileDictionaries;
{
	for (int i=0; i<10; i++)
	{
		int tileIndex = [self.items count];
		NSDictionary * tileDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [NSString stringWithFormat:@"%d", tileIndex], @"ident",
                                         [NSNumber numberWithInt:tileIndex], @"tileIndex",
                                         nil
										 ];
		[self.items addObject:tileDictionary];
	}
}

#pragma mark -
#pragma mark CanvasViewDelegate

- (void) canvasViewDidScrollPrevious:(CanvasView *) canvasView;
{
}

- (void) canvasViewDidScrollNext:(CanvasView *) canvasView;
{
}

- (void) canvasViewDidScrollToLastPage:(CanvasView *) canvasView;
{
	[self addRandomTileDictionaries];
	[canvasView refreshTiles];
}

- (void) canvasViewDidTapTileView:(CanvasTileView *) canvasTileView;
{
    NSLog(@"tapped item: %d", [canvasTileView tileIndex]);
}

#pragma mark -
#pragma mark CanvasDataSource

// Can be overridden to create a CanvasView subclass for custom
// rendering and behaviour
- (CanvasView *) createCanvasViewWithDatasource:(id<CanvasDataSourceProtocol>) datasource;
{
	return [[CanvasView alloc] initWithFrame:CGRectZero withDataSource:self];
}

- (NSUInteger) totalNumberOfTiles
{
	return [self.items count];
}

- (CGSize) pageMargin;
{
	return CGSizeMake(0., 0.);	
}

- (CGSize) tileDimensions;
{
	return CGSizeMake(130., 130.);
}

- (CanvasTileView *) tileViewForIndex:(NSInteger) tileIndex;
{
	CanvasTileView * tileView = [[[CanvasTileView alloc] initWithFrame:[CanvasView rectForTileAtIndex:tileIndex]] autorelease];	
	if (tileIndex >= 0 && tileIndex < [self.items count])
	{
		tileView.tileDictionary = [self.items objectAtIndex:tileIndex];
	}
	else 
	{
		tileView.alpha = 0.4;		
	}
	return tileView;
}

@end
