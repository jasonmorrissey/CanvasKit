//
//  CanvasPageView.m
//  CanvasKit
//
//  Created by JM on 15/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CanvasPageView.h"


@implementation CanvasPageView

@synthesize pageLabel;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) 
	{
        // Initialization code.
		self.backgroundColor = [UIColor redColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect 
{
    // Drawing code.
	[self.pageLabel drawAtPoint:CGPointMake(0, 0) withFont:[UIFont systemFontOfSize:11]];
}

- (void)dealloc 
{
	self.pageLabel = nil;
    [super dealloc];
}


@end
