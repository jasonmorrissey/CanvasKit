//
//  CanvasDataSourceProtocol.h
//  CanvasKit
//
//  Created by D on 16/12/10.
//  Copyright 2010 The Design Shed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasTileView.h"

@protocol CanvasDataSourceProtocol

- (CanvasTileView *) tileViewForIndex:(long) tileIndex;
//- (NSMutableArray *) tileDictionariesInRange:(NSRange) range;
- (long) totalNumberOfTiles;
- (CGSize) tileDimensions;
- (CGSize) pageMargin;

@end
