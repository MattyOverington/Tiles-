//
//  Colour.m
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import "Colour.h"

@interface Colour ()

@property (readwrite)NSInteger red;
@property (readwrite)NSInteger blue;
@property (readwrite)NSInteger green;

@end

@implementation Colour

+ (Colour*)initWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    Colour*c = [[Colour alloc]init];
    c.red = red;
    c.green = green;
    c.blue = blue;
    return c;
    
}

+(Colour*)colourWithPreset:(NSArray *)preset {
    Colour*c = [[Colour alloc]init];
    c.red = [preset objectAtIndex:0];
    c.green = [preset objectAtIndex:1];
    c.blue = [preset objectAtIndex:2];
    return c;
}

@end
