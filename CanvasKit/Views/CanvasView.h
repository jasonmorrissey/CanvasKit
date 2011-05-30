//  Created by Jason Morrissey

#import "CanvasPageView.h"
#import "CanvasPagePlaceholder.h"
#import "CanvasDataSourceProtocol.h"
#import "CanvasViewDelegateProtocol.h"

@interface CanvasView : UIScrollView <UIScrollViewDelegate>
{
	@public	
	id<CanvasDataSourceProtocol> datasource_;
	id<CanvasViewDelegateProtocol> canvasControlDelegate_;
	
	@private	
	int page;
	bool areDimensionsUpdated_;
	bool isVerticalScrolling_;
	CanvasPagePlaceholder * previousPagePlaceholder_;
	CanvasPagePlaceholder * currentPagePlaceholder_;
	CanvasPagePlaceholder * nextPagePlaceholder_;
}

@property int page;
@property bool isVerticalScrolling;
@property (nonatomic,retain) CanvasPagePlaceholder * previousPagePlaceholder;
@property (nonatomic,retain) CanvasPagePlaceholder * currentPagePlaceholder;
@property (nonatomic,retain) CanvasPagePlaceholder * nextPagePlaceholder;
@property (nonatomic,assign) id<CanvasDataSourceProtocol> datasource;
@property (nonatomic,assign) id<CanvasViewDelegateProtocol> canvasControlDelegate;

- (id) initWithFrame:(CGRect)frame withDataSource:(id<CanvasDataSourceProtocol>) datasource;
- (void) refreshTiles;
- (void) resetDimensions;
- (void) scrollToTileAtIndex:(long) tileIndex;
- (void) scrollToPage:(long) pageIndex;
- (void) recalculateTileDimensions;
- (NSUInteger) firstTileAtCurrentPage;
- (void) checkIfNeedForMoreTiles;

// static accessors for subviews
+ (NSUInteger) nColumns;
+ (NSUInteger) nRows;
+ (CGSize) tileSize;
+ (CGSize) tileMargin;
+ (NSUInteger) tilesPerPage;
+ (CGSize) pageMargin;
+ (CGRect) rectForTileAtIndex:(int) index;

@end
