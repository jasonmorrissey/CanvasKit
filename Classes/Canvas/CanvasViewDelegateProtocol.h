//
//  CanvasViewDelegateProtocol.h
//  CanvasKit
//
//  Created by D on 16/12/10.
//  Copyright 2010 The Design Shed. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CanvasView;
@class CanvasTileView;

@protocol CanvasViewDelegateProtocol

- (void) canvasViewDidScrollPrevious:(CanvasView *) canvasView;
- (void) canvasViewDidScrollNext:(CanvasView *) canvasView;
- (void) canvasViewDidScrollToLastPage:(CanvasView *) canvasView;
- (void) canvasViewDidTapTileView:(CanvasTileView *) canvasTileView;

@end
