//  Created by Jason Morrissey

#import "CanvasViewController.h"
#import "CanvasDataSourceProtocol.h"

@interface CanvasViewController()
- (CanvasView *) createCanvasViewWithDatasource:(id<CanvasDataSourceProtocol>) datasource;
@end

@implementation CanvasViewController

@synthesize canvasView = canvasView_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
	{
    }
    return self;
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
	NSUInteger firstVisibleTile = [canvasView_ firstTileAtCurrentPage];
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
    [super viewDidUnload];
}

- (void)dealloc 
{
	self.canvasView.canvasControlDelegate = nil;
	self.canvasView = nil;
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
}

- (void) canvasViewDidScrollNext:(CanvasView *) canvasView;
{
}

- (void) canvasViewDidScrollToLastPage:(CanvasView *) canvasView;
{
}

- (void) canvasViewDidTapTileView:(CanvasTileView *) canvasTileView;
{
}

#pragma mark -
#pragma mark CanvasDataSource

- (CanvasView *) createCanvasViewWithDatasource:(id<CanvasDataSourceProtocol>) datasource;
{
	return [[CanvasView alloc] initWithFrame:CGRectZero withDataSource:self];
}

- (NSUInteger) totalNumberOfTiles
{
	return 0;
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
    return nil;
}


@end
