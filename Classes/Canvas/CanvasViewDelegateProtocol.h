//
//  CanvasViewDelegateProtocol.h
//  CanvasKit
//
//  Created by Jason Morrissey



@class CanvasView;
@class CanvasTileView;

@protocol CanvasViewDelegateProtocol

- (void) canvasViewDidScrollPrevious:(CanvasView *) canvasView;
- (void) canvasViewDidScrollNext:(CanvasView *) canvasView;
- (void) canvasViewDidScrollToLastPage:(CanvasView *) canvasView;
- (void) canvasViewDidTapTileView:(CanvasTileView *) canvasTileView;

@end
