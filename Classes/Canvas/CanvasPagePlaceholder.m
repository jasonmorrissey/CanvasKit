//  Created by Jason Morrissey

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

- (void)dealloc 
{
	self.pageView = nil;
	self.label = nil;
    [super dealloc];
}


@end
