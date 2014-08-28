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



-(Tile *)tileWithX:(CGFloat)x Y:(CGFloat)y {
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

@end
