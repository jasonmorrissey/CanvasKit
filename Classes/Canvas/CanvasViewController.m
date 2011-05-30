//  Created by Jason Morrissey

#import "CanvasViewController.h"
#import "CanvasDataSourceProtocol.h"

@interface CanvasViewController()
- (void) addRandomTileDictionaries;
- (CanvasView *) createCanvasViewWithDatasource:(id<CanvasDataSourceProtocol>) datasource;
@end

@implementation CanvasViewController

@synthesize canvasView = canvasView_;
@synthesize tileDictionaries = tileDictionaries_;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
	{
		tileDictionaries_ = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addRandomTileDictionaries;
{
	for (int i=0; i<25; i++)
	{
		int tileIndex = [self.tileDictionaries count];
		NSDictionary * tileDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
											[NSString stringWithFormat:@"%d", tileIndex], @"ident",
											[NSNumber numberWithInt:tileIndex], @"tileIndex",
											nil
										 ];
		[self.tileDictionaries addObject:tileDictionary];
	}
}

- (void)loadView 
{
	[super loadView];
	canvasView_ = [self createCanvasViewWithDatasource:self];
	canvasView_.canvasControlDelegate = self;
	canvasView_.autoresizesSubviews = YES;
	[self.view addSubview:canvasView_];
	canvasView_.frame = self.view.bounds;
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	long firstVisibleTile = [canvasView_ firstTileAtCurrentPage];
	[canvasView_ resetDimensions];
	[canvasView_ scrollToTileAtIndex:firstVisibleTile];
	[canvasView_ setNeedsDisplay];
}
	 

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
	return YES;
}

- (void)viewDidUnload 
{
	self.canvasView = nil;
	self.view = nil;
    [super viewDidUnload];
}

- (void)dealloc 
{
	self.canvasView.canvasControlDelegate = nil;
	self.canvasView = nil;
	self.view = nil;
	self.tileDictionaries = nil;
    [super dealloc];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	[self viewWillAppear:YES];
}

#pragma mark -
#pragma mark CanvasViewDelegate

- (void) canvasViewDidScrollPrevious:(CanvasView *) canvasView;
{
//	NSLog(@"canvasViewDidScrollPrevious");
}

- (void) canvasViewDidScrollNext:(CanvasView *) canvasView;
{
//	NSLog(@"canvasViewDidScrollNext");
}

- (void) canvasViewDidScrollToLastPage:(CanvasView *) canvasView;
{
//	NSLog(@"canvasViewDidScrollToLastPage");
	[self addRandomTileDictionaries];
	[canvasView refreshTiles];
}

- (void) canvasViewDidTapTileView:(CanvasTileView *) canvasTileView;
{
//	NSLog(@"canvasViewDidTapTileView in()");	
}



#pragma mark -
#pragma mark Canvas Data Source

//- (NSArray *) tileDictionariesInRange:(NSRange) range;
//{
//
//	if (isnan(range.location) || isnan(range.length) || range.length == 0 || range.location < 0 || range.location >= [self.tileDictionaries count])
//	{
//		return nil;
//	}
//	
//	if (range.location + range.length >= [self.tileDictionaries count])
//	{
//		range.length = [self.tileDictionaries count] - range.location;
//	}
//
//	
//	NSLog(@"Requested tiles: %d -> %d (of %d)", range.location, range.location + range.length, [self.tileDictionaries count]);	
//	return [self.tileDictionaries subarrayWithRange:range];
//}

- (CanvasView *) createCanvasViewWithDatasource:(id<CanvasDataSourceProtocol>) datasource;
{
	return [[CanvasView alloc] initWithFrame:CGRectZero withDataSource:self];
}

- (long) totalNumberOfTiles
{
	return [self.tileDictionaries count];
}

- (CGSize) pageMargin;
{
	return CGSizeMake(0., 0.);	
}

- (CGSize) tileDimensions;
{
	return CGSizeMake(120., 100.);
}

- (CanvasTileView *) tileViewForIndex:(long) tileIndex;
{
	CanvasTileView * tileView = [[[CanvasTileView alloc] initWithFrame:[CanvasView rectForTileAtIndex:tileIndex]] autorelease];	
	if (tileIndex >= 0 && tileIndex < [self.tileDictionaries count])
	{
		tileView.tileDictionary = [self.tileDictionaries objectAtIndex:tileIndex];
	}
	else 
	{
		tileView.alpha = 0.1;		
	}
	return tileView;
}


@end
