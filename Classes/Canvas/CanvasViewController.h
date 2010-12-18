//
//  CanvasViewController.h
//  CanvasKit
//
//  Created by JM on 15/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasView.h"
#import "CanvasDataSourceProtocol.h"
#import "CanvasViewDelegateProtocol.h"

@interface CanvasViewController : UIViewController <CanvasDataSourceProtocol, CanvasViewDelegateProtocol>
{
	CanvasView * canvasView_;
	NSMutableArray * tileDictionaries_;
}

@property (nonatomic, retain) CanvasView * canvasView;
@property (nonatomic, retain) NSMutableArray * tileDictionaries;

@end
