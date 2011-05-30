//  Created by Jason Morrissey

#import "CanvasPageView.h"

@interface CanvasPagePlaceholder : UIView {
	CanvasPageView * pageView_;
	NSString * label_;
}

@property (nonatomic,retain) CanvasPageView * pageView;
@property (nonatomic,retain) NSString * label;

- (id)initWithFrame:(CGRect)frame withLabel:(NSString *) lbl;

@end
