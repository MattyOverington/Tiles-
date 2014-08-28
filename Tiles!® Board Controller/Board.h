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

@interface Board : NSObject

@property (readonly) NSMutableArray* allTiles;

-(id)initWithWidth:(NSInteger)width height:(NSInteger)height;
-(Tile*)tileWithX:(CGFloat)x Y:(CGFloat)y;
-(void) moveContentsOfTile:(Tile*)firstTile toTile:(Tile*)secondTile;
-(void) deleteContentsOfTile:(Tile*)tile;
-(void) assignContentsOfTile:(Tile*)tile withContents:(Piece*) piece;

@end
