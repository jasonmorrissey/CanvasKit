//
//  CanvasDataSourceProtocol.h
//  CanvasKit
//
//  Created by Jason Morrissey


#import "CanvasTileView.h"

@protocol CanvasDataSourceProtocol

- (CanvasTileView *) tileViewForIndex:(long) tileIndex;
//- (NSMutableArray *) tileDictionariesInRange:(NSRange) range;
- (long) totalNumberOfTiles;
- (CGSize) tileDimensions;
- (CGSize) pageMargin;

@end
