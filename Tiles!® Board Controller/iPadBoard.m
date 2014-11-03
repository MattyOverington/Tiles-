//
//  iPadBoard.m
//  Tiles!® Board Controller
//
//  Created by Tom Copcutt on 9/8/14.
//  Copyright (c) 2014 Matthew Overington. All rights reserved.
//

#import "iPadBoard.h"
@interface iPadBoard ()
@property id game;

@property (readwrite) NSMutableArray* allGridSquares;



@end

@implementation iPadBoard
- (instancetype)initWithWidth:(NSInteger)width height:(NSInteger)height {
    
    self.width = width;
    self.height = height;
    
    self = [super init];
    self.allGridSquares = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < width; i++) {
        NSMutableArray* temp = [[NSMutableArray alloc] init];
        [self.allGridSquares addObject:temp];
    }
    
    for (int i = 0; i<width; i++) {
        for (int j = 0; j<height; j++) {
            iPadTile *t = [[iPadTile alloc]initWithPosition:i :j contents:nil];
            [[self.allGridSquares objectAtIndex:i] addObject:t];
        }
    }
    self.game = [[PianoTile alloc]initWithDelegate:self];
    return self;
}
-(void)touchFromArduinoX:(NSInteger)x Y:(NSInteger)y{
    [self tileWithX:x Y:y];
    [self.game touchAtSquare:[self tileWithX:x Y:y]];
}


-(iPadTile *)tileWithX:(NSInteger)x Y:(NSInteger)y {
    assert(x > -1);
    assert(y > -1);

    assert(y < [self.allGridSquares count]);
    assert(x < [self.allGridSquares count]);
    iPadTile* blah = [[self.allGridSquares objectAtIndex:x] objectAtIndex:y];
    return [[self.allGridSquares objectAtIndex:x] objectAtIndex:y];
};

-(iPadTile*)tileWithPosition:(CGPoint)position {
    assert(position.x > -1);
    assert(position.y > -1);
    
    assert(position.y < [self.allGridSquares count]);
    assert(position.x < [self.allGridSquares count]);
    
    return [[self.allGridSquares objectAtIndex:position.x] objectAtIndex:position.y];
}



- (iPadTile *)tileWithTouch:(Touch*)touch {
    return [self tileWithX:touch.x Y:touch.y];
}


- (void)moveContentsOfTile:(Tile *)firstTile toTile:(Tile *)secondTile {
    secondTile.contents = firstTile.contents;
    firstTile.contents = nil;
}

-(void)deleteContentsOfTile:(Tile *)tile {
    [tile deleteContents];
}

-(void) assignContentsOfTile:(iPadTile*)tile withContents:(id) contents {
    [tile assignContents:contents];
}
-(void) replaceContentsOfTile:(iPadTile*)tile withContents:(id) contents {
    
    [[[self.allGridSquares objectAtIndex:tile.x] objectAtIndex:tile.y] replaceContentsWith:contents];
}



- (void)changeColorOfTileAtX:(NSInteger)x Y:(NSInteger)y toColour:(Colour*) c{
    
    [[[self.allGridSquares objectAtIndex:x] objectAtIndex:y] setTileColour: c];
}



- (void)changeColorOfTile:(iPadTile*)tile toColour:(Colour*) c{
    
    [[[self.allGridSquares objectAtIndex:tile.x] objectAtIndex:tile.y] setTileColour:c];

}

- (void)changeColorOfTilesAtX1:(NSInteger)x1 X2:(NSInteger)x2 Y1:(NSInteger)y1 Y2:(NSInteger)y2 toColour:(Colour *)c {
    
    //assert(x2 > x1);
    //assert(y2 > y1);
    
    //assert(x1 > -1);
    //assert(x2 < [self.allGridSquares count]);
    
    //assert(x1 > -1);
    //assert(x2 < [self.allGridSquares count]);
    
    NSMutableArray* tilesToChange = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < y2 - y1; i++) {
        NSRange range;
        range.length = x2-x1;
        range.location = x1;
        
        NSIndexSet* i = [[NSIndexSet alloc] initWithIndexesInRange:range];
        [tilesToChange addObject:[self.allGridSquares objectsAtIndexes:i]];
    }
    
    for (iPadTile* t in tilesToChange) {
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

//time interval method
-(void)update:(CFTimeInterval)currentTime {
        [self.game update:currentTime];
    
}
-(void) crazyColours {

        for (NSInteger i = 0; i < self.height; i++) {
            for (NSInteger j = 0; j <= self.width-1; j++) {
                [self changeColorOfTile:[self tileWithX:j Y:i] toColour:[Colour initWithRed:0 green:arc4random_uniform(255) blue:arc4random_uniform(255)]] ;

            }
        
    
    

}
}
-(void)test {
   
}

@end
