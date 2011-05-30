//  Created by Jason Morrissey

#import "CanvasView.h"
#import "CanvasDataSourceProtocol.h"
#import "CanvasViewDelegateProtocol.h"

@interface CanvasViewController : UIViewController <CanvasDataSourceProtocol, CanvasViewDelegateProtocol>
{
	CanvasView * canvasView_;
}

@property (nonatomic, retain) CanvasView * canvasView;

@end
