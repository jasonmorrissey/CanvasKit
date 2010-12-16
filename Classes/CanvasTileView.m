//
//  CanvasTileView.m
//  CanvasKit
//
//  Created by D on 16/12/10.
//  Copyright 2010 The Design Shed. All rights reserved.
//

#import "CanvasTileView.h"


@implementation CanvasTileView

@synthesize tileDictionary = tileDictionary_;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	NSString * ident = [self.tileDictionary objectForKey:@"ident"];
	[ident drawAtPoint:CGPointMake(5, 5) withFont:[UIFont boldSystemFontOfSize:10]];
}


- (void)dealloc {
	self.tileDictionary = nil;
    [super dealloc];
}


@end
