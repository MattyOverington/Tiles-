//
//  Piece.h
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"
#import "Player.h"
#import "Colour.h"

@class Tile;

@interface Piece : NSObject

@property NSString* name;
@property Tile* locationTile;
@property Player* owner;
@property (readonly) Colour* colour;

-(id)initPieceWithName:(NSString*)name OnTile:(Tile*)tile forPlayer:(Player*) player;
-(void)setPieceColour:(Colour*)colour;

@end
