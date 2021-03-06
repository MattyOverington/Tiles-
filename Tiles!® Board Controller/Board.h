//
//  Board.h
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#define MAX_GRID_X 8
#define MAX_GRID_Y 8


#import <Foundation/Foundation.h>
#import "Tile.h"
#import "Touch.h"

@interface Board : NSObject

@property (readonly) NSMutableArray* allTiles;

-(id)initWithWidth:(NSInteger)width height:(NSInteger)height;
-(Tile*)tileWithX:(NSInteger)x Y:(NSInteger)y;
-(Tile*)tileWithTouch:(Touch*)touch;

-(void) moveContentsOfTile:(Tile*)firstTile toTile:(Tile*)secondTile;
-(void) deleteContentsOfTile:(Tile*)tile;
-(void) assignContentsOfTile:(Tile*)tile withContents:(Piece*) piece;

-(void) changeColorOfTileAtX:(NSInteger)x Y:(NSInteger)y toColour:(Colour*) c;
-(void) changeColorOfTilesAtX1:(NSInteger)x1 X2:(NSInteger)x2 Y1:(NSInteger)y1 Y2:(NSInteger) y2 toColour:(Colour*) c;
-(void) changeColorOfAllTiles:(Colour*) colour;

@end
