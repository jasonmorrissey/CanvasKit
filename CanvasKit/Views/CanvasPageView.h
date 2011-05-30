//  Created by Jason Morrissey

#import "CanvasDataSourceProtocol.h"

@interface CanvasPageView : UIView 
{
	NSUInteger pageIndex;
}

@property NSUInteger pageIndex;

- (void) updateTiles;
- (BOOL) isOnscreen;
@end
