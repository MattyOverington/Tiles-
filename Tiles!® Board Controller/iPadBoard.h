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
#import "PianoTile.h"

#define MAX_GRID_X 8
#define MAX_GRID_Y 8
@interface iPadBoard : NSObject <PianoTileDelegate>


@property (readonly) NSMutableArray* allTiles;
@property NSInteger height;
@property NSInteger width;
-(id)initWithWidth:(NSInteger)width height:(NSInteger)height;
-(iPadTile*)tileWithX:(NSInteger)x Y:(NSInteger)y;
-(iPadTile*)tileWithTouch:(Touch*)touch;
-(iPadTile*)tileWithPosition:(CGPoint)position;
-(void)touchFromArduinoX:(NSInteger)x Y:(NSInteger)y;

-(void) moveContentsOfTile:(iPadTile*)firstTile toTile:(iPadTile*)secondTile;
-(void) deleteContentsOfTile:(iPadTile*)tile;
-(void) assignContentsOfTile:(iPadTile*)tile withContents:(id) contents;
-(void) replaceContentsOfTile:(iPadTile*)tile withContents:(id) contents;


- (void)changeColorOfTile:(iPadTile*)tile toColour:(Colour*) c;
-(void) changeColorOfTileAtX:(NSInteger)x Y:(NSInteger)y toColour:(Colour*) c;
-(void) changeColorOfTilesAtX1:(NSInteger)x1 X2:(NSInteger)x2 Y1:(NSInteger)y1 Y2:(NSInteger) y2 toColour:(Colour*) c;
-(void) changeColorOfAllTiles:(Colour*) colour;


@end
