//
//  CanvasPagePlaceholder.h
//  CanvasKit
//
//  Created by D on 16/12/10.
//  Copyright 2010 The Design Shed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasPageView.h"


@interface CanvasPagePlaceholder : UIView {
	CanvasPageView * pageView_;
	NSString * label_;
}

@property (nonatomic,retain) CanvasPageView * pageView;
@property (nonatomic,retain) NSString * label;

- (id)initWithFrame:(CGRect)frame withLabel:(NSString *) lbl;

@end
