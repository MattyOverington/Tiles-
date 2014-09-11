//
//  Colour.h
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColourValues.h"

@interface Colour : NSObject

@property (readonly) NSInteger red;
@property (readonly) NSInteger green;
@property (readonly) NSInteger blue;

+(void)initWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
+(void)colourWithPreset:(NSArray *)preset;
@end
