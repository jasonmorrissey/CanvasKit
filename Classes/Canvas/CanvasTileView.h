//
//  CanvasTileView.h
//  CanvasKit
//
//  Created by D on 16/12/10.
//  Copyright 2010 The Design Shed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasViewDelegateProtocol.h"

@interface CanvasTileView : UIView {
	NSDictionary * tileDictionary_;
	BOOL highlighted_;
	BOOL selected_;
	long tileIndex_;
}

@property (nonatomic,retain) NSDictionary * tileDictionary;
@property BOOL highlighted;
@property BOOL selected;
@property long tileIndex;

- (BOOL) isOnscreen;
- (BOOL) isDragging;
- (id<CanvasViewDelegateProtocol>) canvasControlDelegate;
- (void) tileWillDealloc;
@end
