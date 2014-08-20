//
//  Colour.h
//  Tiles!® Board Controller
//
//  Created by Matthew Overington on 8/19/14.
//  Copyright (c) 2014 Matthew Overington. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Colour : NSObject

@property (readonly) NSInteger red;
@property (readonly) NSInteger green;
@property (readonly) NSInteger blue;

-(uint8_t[])convertToUnsignedInt;
-(void)initWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

@end
