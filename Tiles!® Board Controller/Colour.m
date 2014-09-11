//
//  Colour.m
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import "Colour.h"

@interface Colour ()

@property NSInteger r;
@property NSInteger b;
@property NSInteger g;

@end

@implementation Colour

+ (void)initWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    Colour*c = [[Colour alloc]init];
    c.r = red;
    c.g = green;
    c.b = blue;
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
+(void)colourWithPreset:(NSArray *)preset {
    Colour*c = [[Colour alloc]init];
    c.r = [preset objectAtIndex:0];
    c.g = [preset objectAtIndex:1];
    c.b = [preset objectAtIndex:2];
}

@end
