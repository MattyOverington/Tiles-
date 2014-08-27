//
//  TSDPiece.m
//  Stff4Stff4Stff4Stff
//
//  Created by Tom Copcutt on 8/12/14.
//  Copyright (c) 2014 TheSwaggyDog. All rights reserved.
//

#import "Piece.h"

@implementation Piece

- (id)initPieceWithName:(NSString*)name OnTile:(Tile*)tile forPlayer:(Player*)player{
    self = [super init];
    self.owner = player;
    self.locationTile = tile;

    return self;
}

- (void)setPieceColour:(Colour *)colour {
    [self setColour:colour];
}

- (void)setColour:(Colour *)colour {
    self.colour = colour;
}

@end
