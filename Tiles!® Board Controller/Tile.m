//
//  Tile.m
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import "Tile.h"

@implementation Tile

-(id)initWithPosition:(CGFloat)x :(CGFloat)y contents:(id)contents {
    self.x = x;
    self.y = y;
    self.contents = contents;
    self.tileColour = [Colour colourWithPreset:COLOUR_WHITE];
    if (self.contents == nil) {
        self.isFree = YES;
    }
    
    return self;
}
-(void)replaceContentsWith:(id)contents {
    self.contents = contents;
    self.isFree = NO;
}

-(void)assignContents:(id)contents {
    if (self.contents == nil) {
        self.contents = contents;
        self.isFree = NO;
    }
}
-(void)deleteContents {
    self.contents = nil;
    self.isFree = YES;
}

-(void)setColour:(Colour *)colour {
    self.colour = colour;
}

@end
