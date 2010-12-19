//
//  CanvasPageView.h
//  CanvasKit
//
//  Created by JM on 15/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasDataSourceProtocol.h"

@interface CanvasPageView : UIView 
{
	int pageIndex;
}

@property int pageIndex;

- (void) updateTiles;
@end
