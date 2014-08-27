//
//  TSDGridSquare.m
//  Stff4Stff4Stff4Stff
//
//  Created by Tom Copcutt on 8/12/14.
//  Copyright (c) 2014 TheSwaggyDog. All rights reserved.
//

#import "Tile.h"

@implementation Tile

-(id)initWithPosition:(CGFloat)x :(CGFloat)y contents:(id)contents {
    self.x = x;
    self.y = y;
    self.contents = contents;
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
