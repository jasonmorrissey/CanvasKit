//
//  CanvasView.h
//  CanvasKit
//
//  Created by JM on 15/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasPageView.h"

@interface CanvasView : UIScrollView <UIScrollViewDelegate>
{
	CanvasPageView * previousPageView_;
	CanvasPageView * currentPageView_;
	CanvasPageView * nextPageView_;
	
	// index of currentPage
	int page;
}

@property int page;
@property (nonatomic,assign) CanvasPageView * previousPageView;
@property (nonatomic,assign) CanvasPageView * currentPageView;
@property (nonatomic,assign) CanvasPageView * nextPageView;

@end
