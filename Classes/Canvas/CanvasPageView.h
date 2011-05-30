//
//  CanvasPageView.h
//  CanvasKit
//
//  Created by Jason Morrissey


#import "CanvasDataSourceProtocol.h"

@interface CanvasPageView : UIView 
{
	int pageIndex;
}

@property int pageIndex;

- (void) updateTiles;
- (BOOL) isOnscreen;
@end
