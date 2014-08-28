//
//  Board.m
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import "Board.h"
@interface Board ()

@property (readwrite) NSMutableArray* allGridSquares;
@property NSInteger height;
@property NSInteger width;


@end

@implementation Board

- (instancetype)initWithWidth:(NSInteger)width height:(NSInteger)height {
    
    assert(width <= MAX_GRID_X);
    assert(height <= MAX_GRID_Y);
    
    self = [super init];
    self.allGridSquares = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < width; i++) {
        NSMutableArray* temp = [[NSMutableArray alloc] init];
        [self.allGridSquares addObject:temp];
    }
         
    for (int i = 0; i<width; i++) {
        for (int j = 0; j<height; j++) {
            Tile *t = [[Tile alloc]initWithPosition:i :j contents:nil];
            [[self.allGridSquares objectAtIndex:i] addObject:t];
        }
    }
         
    return self;
}



-(Tile *)tileWithX:(NSInteger)x Y:(NSInteger)y {
    assert(x > -1);
    assert(y > -1);
    
    assert(y < [self.allGridSquares count]);
    assert(x < [self.allGridSquares count]);
    
    return [[self.allGridSquares objectAtIndex:x] objectAtIndex:y];
}


- (void)moveContentsOfTile:(Tile *)firstTile toTile:(Tile *)secondTile {
    secondTile.contents = firstTile.contents;
    firstTile.contents = nil;
}

-(void)deleteContentsOfTile:(Tile *)tile {
    [tile deleteContents];
}

- (void)assignContentsOfTile:(Tile *)tile withContents:(Piece *)piece {
    [tile replaceContentsWith:piece];
}

- (void)changeColorOfTileAtX:(NSInteger)x Y:(NSInteger)y toColour:(Colour*) c{
    Tile* t = [[self.allGridSquares objectAtIndex:x] objectAtIndex:y];
    [t setTileColour: c];
}

- (void)changeColorOfTilesAtX1:(NSInteger)x1 X2:(NSInteger)x2 Y1:(NSInteger)y1 Y2:(NSInteger)y2 toColour:(Colour *)c {
    
    assert(x2 > x1);
    assert(y2 > y1);
    
    assert(x1 > -1);
    assert(x2 < [self.allGridSquares count]);
    
    assert(x1 > -1);
    assert(x2 < [self.allGridSquares count]);
    
    NSMutableArray* tilesToChange = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < y2 - y1; i++) {
        NSRange range;
        range.length = x2-x1;
        range.location = x1;
        
        NSIndexSet* i = [[NSIndexSet alloc] initWithIndexesInRange:range];
        [tilesToChange addObject:[self.allGridSquares objectsAtIndexes:i]];
    }
    
    for (Tile* t in tilesToChange) {
        [t setTileColour:c];
    }
}

- (void)changeColorOfAllTiles:(Colour *)colour {
    for (NSMutableArray* m in self.allGridSquares) {
        for (Tile* t in m) {
            [t setTileColour:colour];
        }
    }
}

@end
