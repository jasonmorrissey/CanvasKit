//
//  CanvasView.m
//  CanvasKit
//
//  Created by JM on 15/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CanvasView.h"

@implementation CanvasView

@synthesize previousPageView = previousPageView_;
@synthesize currentPageView = currentPageView_;
@synthesize nextPageView = nextPageView_;
@synthesize page;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) 
	{
		self.delegate = self;
		self.backgroundColor = [UIColor blackColor];
		self.decelerationRate = 0.5;

		page = 0;
		previousPageView_ = [[CanvasPageView alloc] init];
		currentPageView_ = [[CanvasPageView alloc] init];
		nextPageView_ = [[CanvasPageView alloc] init];

		[self addSubview:previousPageView_];
		[self addSubview:currentPageView_];
		[self addSubview:nextPageView_];
		
		CGSize boundSize = self.bounds.size;
		
		// create enough scroll space for 3 page panels (prev, current, next)
		self.contentSize = CGSizeMake(boundSize.width * 3, boundSize.height);
		
		self.previousPageView.frame = CGRectMake(0, 0, boundSize.width, boundSize.height);
		self.currentPageView.frame = CGRectMake(boundSize.width, 0, boundSize.width, boundSize.height);
		self.nextPageView.frame = CGRectMake(boundSize.width * 2, 0, boundSize.width, boundSize.height);

		
//		// set to offset to center page
//		self.contentOffset = CGPointMake(boundSize.width, 0);
		
    }
    return self;
}



- (void) layoutSubviews
{
	[super layoutSubviews];
	self.previousPageView.pageLabel = [NSString stringWithFormat:@"%d", page - 1];
	self.currentPageView.pageLabel = [NSString stringWithFormat:@"%d", page];
	self.nextPageView.pageLabel = [NSString stringWithFormat:@"%d", page + 1];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
	[self.previousPageView release], nil;
	[self.currentPageView release], nil;
	[self.nextPageView release], nil;
    [super dealloc];
}

- (void) snapToEdges
{
	CGFloat boundWidth = self.bounds.size.width;
	CGFloat xOffset = self.contentOffset.x;
	CGFloat scrollToOffset;

	if (xOffset > boundWidth * 0.7 &&
		xOffset < boundWidth * 1.4) 
	{
		scrollToOffset = boundWidth;
	}
	else if (xOffset < boundWidth)
	{
		scrollToOffset = 0;
	}
	else if (xOffset >= (boundWidth * 2))
	{
		scrollToOffset = boundWidth * 2;
	}
	else 
	{
		scrollToOffset = boundWidth;
	}

	
	[self setContentOffset:CGPointMake(scrollToOffset,0) animated:YES];
	
//	
//	CGFloat scrollRatio = (self.contentOffset.x / boundWidth);
//	int snappingToPage;
//	if (scrollRatio > 0.75)
//	{
//		snappingToPage = self.page + 1;
//	}
//	else if (scrollRatio < 0.25)
//	{
//		snappingToPage = self.page - 1;
//	}
//	else
//	{
//		snappingToPage = self.page;
//	}
//
//	if (snappingToPage >= -1)
//		self.page = snappingToPage;	
//	else 
//		self.page = -1;
//
//	self.contentOffset = CGPointMake((self.page + 1) * boundWidth, 0);
//
//	NSLog(@"Scroll Ratio: %f", scrollRatio);
	
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	[self snapToEdges];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	[self snapToEdges];
}

@end
