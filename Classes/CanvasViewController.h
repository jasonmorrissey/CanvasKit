//
//  CanvasViewController.h
//  CanvasKit
//
//  Created by JM on 15/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasView.h"

@interface CanvasViewController : UIViewController {
	CanvasView * canvasView_;
}

@property (nonatomic, assign) CanvasView * canvasView;

@end
