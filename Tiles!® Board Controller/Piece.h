//
//  TSDPiece.h
//  Stff4Stff4Stff4Stff
//
//  Created by Tom Copcutt on 8/12/14.
//  Copyright (c) 2014 TheSwaggyDog. All rights reserved.
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
