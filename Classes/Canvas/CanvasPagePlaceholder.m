//
//  CanvasPagePlaceholder.m
//  CanvasKit
//
//  Created by D on 16/12/10.
//  Copyright 2010 The Design Shed. All rights reserved.
//

#import "CanvasPagePlaceholder.h"
#import "CanvasView.h"

@implementation CanvasPagePlaceholder

@synthesize pageView = pageView_;
@synthesize label = label_;

- (id)initWithFrame:(CGRect)frame withLabel:(NSString *) lbl;
{    
    self = [super initWithFrame:frame];
    if (self) 
	{
        // Initialization code.
		self.backgroundColor = [UIColor clearColor];
		self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		pageView_ = [[CanvasPageView alloc] init];
		self.label = lbl;
		[self addSubview:pageView_];
    }
    return self;
}


- (void) layoutSubviews
{
	[super layoutSubviews];	
	[pageView_ setFrame:CGRectMake([CanvasView pageMargin].width, [CanvasView pageMargin].height, self.bounds.size.width-[CanvasView pageMargin].width * 2, self.bounds.size.height-[CanvasView pageMargin].height * 2)];	
}

//@synthesize pageView = pageView_;

//- (id)initWithFrame:(CGRect)frame {
//    
//    self = [super initWithFrame:frame];
//    if (self) 
//	{
//		[self addSubview:pageView_];
//    }
//    return self;
//}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	[self.label drawAtPoint:CGPointMake(0, 0) withFont:[UIFont systemFontOfSize:11]];
}

- (void)dealloc {
	self.pageView = nil;
	self.label = nil;
    [super dealloc];
}


@end
