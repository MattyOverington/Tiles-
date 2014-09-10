//
//  iPadTile.h
//  Tiles!® Board Controller
//
//  Created by Tom Copcutt on 9/8/14.
//  Copyright (c) 2014 Matthew Overington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Colour.h"
#import "Piece.h"
@class Piece;
@interface iPadTile : NSObject




@property BOOL isFree;
@property CGFloat x;
@property CGFloat y;
@property CGPoint position;
@property Piece* contents;
@property Colour* tileColour;

-initWithPosition:(CGFloat)x :(CGFloat)y contents:(id)contents;
-(void)replaceContentsWith:(id)contents;
-(void)assignContents:(id)contents;
-(void)deleteContents;
-(void)setColour:(Colour *)colour;


@end


