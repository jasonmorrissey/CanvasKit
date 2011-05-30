//  Created by Jason Morrissey

#import "CanvasViewDelegateProtocol.h"

@interface CanvasTileView : UIView 
{
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
- (void) tileWillRelease;
@end
