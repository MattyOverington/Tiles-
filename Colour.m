//
//  Colour.m
//  Tiles!® Board Controller
//
//  Created by Matthew Overington on 8/19/14.
//  Copyright (c) 2014 Matthew Overington. All rights reserved.
//

#import "Colour.h"

@interface Colour ()

@property NSInteger r;
@property NSInteger b;
@property NSInteger g;

@end

@implementation Colour

- (void)initWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    self.r = red;
    self.b = blue;
    self.g = green;
}

- (NSInteger)red {
    return self.r;
}

- (NSInteger)green {
    return self.g;
}

- (NSInteger)blue {
    return self.b;
}

@end
