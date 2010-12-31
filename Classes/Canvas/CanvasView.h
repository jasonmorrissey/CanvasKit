//
//  CanvasView.h
//  CanvasKit
//
//  Created by JM on 15/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
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
@property (nonatomic,retain) id<CanvasDataSourceProtocol> datasource;
@property (nonatomic,retain) id<CanvasViewDelegateProtocol> canvasControlDelegate;


- (id)initWithFrame:(CGRect)frame withDataSource:(id<CanvasDataSourceProtocol>) datasource;
- (void) refreshTiles;
- (void) resetDimensions;
- (void) scrollToTileAtIndex:(long) tileIndex;
- (void) recalculateTileDimensions;


// static accessors for subviews
+ (int) nColumns;
+ (int) nRows;
+ (CGSize) tileSize;
+ (CGSize) tileMargin;
+ (int) tilesPerPage;
+ (CGSize) pageMargin;
+ (CGRect) rectForTileAtIndex:(int) index;
@end
