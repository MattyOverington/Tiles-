//
//  Piece.m
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
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
