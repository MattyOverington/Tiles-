//
//  Tile.h
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Colour.h"
#import "Piece.h"

@class Piece;

@interface Tile : NSObject

@property BOOL isFree;
@property CGFloat x;
@property CGFloat y;
@property Piece* contents;
@property Colour* tileColour;

-initWithPosition:(CGFloat)x :(CGFloat)y contents:(id)contents;
-(void)replaceContentsWith:(id)contents;
-(void)assignContents:(id)contents;
-(void)deleteContents;
-(void)setColour:(Colour *)colour;


@end
