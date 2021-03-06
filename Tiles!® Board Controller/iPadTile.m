//
//  iPadTile.m
//  Tiles!® Board Controller
//
//  Created by Tom Copcutt on 9/8/14.
//  Copyright (c) 2014 Matthew Overington. All rights reserved.
//

#import "iPadTile.h"

@implementation iPadTile
-(id)initWithPosition:(CGFloat)x :(CGFloat)y contents:(id)contents {
    self.x = x;
    self.y = y;
    self.position = CGPointMake(x, y);
    self.contents = contents;
    if (self.contents == nil) {
        self.isFree = YES;
    }
    float num1 = arc4random_uniform(255)/255.0f;
    float num2 = arc4random_uniform(255)/255.0f;
    float num3 = arc4random_uniform(255)/255.0f;
    
    self.tileColour = [Colour initWithRed:num1 green:num2 blue:num3];
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


@end
