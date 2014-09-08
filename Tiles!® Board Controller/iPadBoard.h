//
//  iPadBoard.h
//  Tiles!® Board Controller
//
//  Created by Tom Copcutt on 9/8/14.
//  Copyright (c) 2014 Matthew Overington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iPadTile.h"
#import "Touch.h"


@interface iPadBoard : NSObject


@property (readonly) NSMutableArray* allTiles;

-(id)initWithWidth:(NSInteger)width height:(NSInteger)height;
-(iPadTile*)tileWithX:(NSInteger)x Y:(NSInteger)y;
-(iPadTile*)tileWithTouch:(Touch*)touch;
-(iPadTile*)squareWithPosition:(CGPoint)position;

-(void) moveContentsOfTile:(iPadTile*)firstTile toTile:(iPadTile*)secondTile;
-(void) deleteContentsOfTile:(iPadTile*)tile;
-(void) assignContentsOfTile:(iPadTile*)tile withContents:(iPadTile*) piece;

-(void) changeColorOfTileAtX:(NSInteger)x Y:(NSInteger)y toColour:(Colour*) c;
-(void) changeColorOfTilesAtX1:(NSInteger)x1 X2:(NSInteger)x2 Y1:(NSInteger)y1 Y2:(NSInteger) y2 toColour:(Colour*) c;
-(void) changeColorOfAllTiles:(Colour*) colour;


@end
