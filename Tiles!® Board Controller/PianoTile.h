//
//  PianoTile.h
//  Tiles!® Board Controller
//
//  Created by Tom Copcutt on 9/3/14.
//  Copyright (c) 2014 Matthew Overington. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "iPadTile.h"
#import "Touch.h"

@protocol PianoTileDelegate
-(iPadTile*)tileWithTouch:(Touch *)touch;
-(iPadTile*)tileWithX:(NSInteger)x Y:(NSInteger)y;


-(void) moveContentsOfTile:(iPadTile*)firstTile toTile:(iPadTile*)secondTile;
-(void) deleteContentsOfTile:(iPadTile*)tile;
-(void) assignContentsOfTile:(iPadTile*)tile withContents:(id) contents;
-(void) replaceContentsOfTile:(iPadTile*)tile withContents:(id) contents;



-(void) changeColorOfTile:(iPadTile*)tile toColour:(Colour*) c;
-(void) changeColorOfTileAtX:(NSInteger)x Y:(NSInteger)y toColour:(Colour*) c;
-(void) changeColorOfTilesAtX1:(NSInteger)x1 X2:(NSInteger)x2 Y1:(NSInteger)y1 Y2:(NSInteger) y2 toColour:(Colour*) c;
-(void) changeColorOfAllTiles:(Colour*) colour;

@property NSInteger height;
@property NSInteger width;

@end


@interface PianoTile : NSObject
-(void)scroll;


@property id<PianoTileDelegate> delegate;
-(id)initWithDelegate:(id)delegate;
-(void)touchAtSquare:(iPadTile *)touchedSquare;
-(void)update:(CFTimeInterval)currentTime;
/*
Have a method that shifts all tiles to the row below, then generate new row with black tile on random column.
        we could maybe have an initial increased chance that a tile will be in the same column as the previous but that decays until there is significantly less chance, so we have lengths of 3-5 in the same column but not lengths of 10... thats just silly
 
Maybe do the pro version where two tiles are never on the same column? (i like that mode :P)
score display on iPad
red flash if you stuff up
 
 

OTHEr GAME IDEAS
coloured tiles, touch a tile and all same colour tiles pop and new tiles fall, better score for more ltiles poped in one go

 timed simple mazes
 
 those puzzles with 9 (or 16) sqares and one is taken out. active board is in the top left and finished product is in the bottom right (the one that apple has on the dashboard)
 
 
 
 puzzle and dragons :P :P :P :P :P
wait can you even drag your finger on this board??
 otherwise just tap heaps and double tap the tile to let go
 WE GOTTA MAKE DIS MATT
 
 
 also we should ask rishi and sushi if they have ideas, they are part of the project too
 
 
 
 
 Yay i got something done toaday
 
*/

@end
