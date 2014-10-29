//
//  PianoTile.m
//  Tiles!® Board Controller
//
//  Created by Tom Copcutt on 9/3/14.
//  Copyright (c) 2014 Matthew Overington. All rights reserved.
//

#import "PianoTile.h"
@interface PianoTile()
@property NSInteger tileColumnCount;
@property NSInteger lastTilePosition;
@property BOOL gameFinshed;
@end
@implementation PianoTile
- (id)initWithDelegate:(id)delegate
{
    self = [super init];
    self.tileColumnCount = 1;
    self.lastTilePosition = 0;
    self.delegate = delegate;
    self.gameFinshed = NO;
    for (NSInteger i = 0;i<self.delegate.height-2;i++) {
        [self scroll];
        
        
    }
    
    
    return self;
}

-(void)touchAtSquare:(iPadTile *)touchedSquare {
    if ([touchedSquare.contents isEqual:@"black" ]) {
        //register touched
        [self.delegate replaceContentsOfTile:touchedSquare withContents:@"touched"];
        [self.delegate changeColorOfTile:touchedSquare toColour:[Colour initWithRed:175 green:175 blue:175]] ; //<< idk whats wrong here, i think its cause we used {} rather than []... cbf changing now
        
        
        
    }
    else if ([touchedSquare.contents isEqual:@"white"]) {
        [self.delegate changeColorOfTile:touchedSquare toColour:[Colour initWithRed:255 green:90 blue:90]] ;
        [self gameFinish];
        
        
    }
 
}




-(void)scroll{
    if(self.gameFinshed == NO) {
        NSArray* row = [self newRow];
        for (NSInteger i = 0; i < self.delegate.height; i++) {
            for (NSInteger j = 0; j <= self.delegate.width-1; j++) {
                if (i==0) {
                    if ([[self.delegate tileWithX:j Y:i].contents  isEqual: @"black"]) {
                        [self.delegate changeColorOfTile:[self.delegate tileWithX:j Y:i] toColour:[Colour initWithRed:255 green:90 blue:90]];
                        [self gameFinshed];
                    }
                }
                if (i==self.delegate.height-1) {
                    iPadTile *destination = [self.delegate tileWithX:j Y:i];
                    iPadTile *source = [row objectAtIndex:j];
                    [self.delegate replaceContentsOfTile:destination withContents:source.contents];
                    [self.delegate changeColorOfTile:destination toColour:source.tileColour];
                }                else{
                    [self.delegate replaceContentsOfTile:[self.delegate tileWithX:j Y:i] withContents:[self.delegate tileWithX:j Y:i+1].contents];
                    [self.delegate changeColorOfTile:[self.delegate tileWithX:j Y:i] toColour:[self.delegate tileWithX:j Y:i+1].tileColour];
                }
            }
        }
    }
}

-(void)gameFinish {
    self.gameFinshed = YES;
}

-(NSArray *)newRow{
    NSMutableArray *row = [[NSMutableArray alloc]init];
    NSInteger blackSquare = arc4random_uniform(self.delegate.width);
    for (NSInteger i = 0; i < 8; i++) {
        iPadTile *tile = [[iPadTile alloc]init];
        if (i == blackSquare) {
            [tile assignContents:@"black"];
            [tile setTileColour:[Colour initWithRed:0 green:0 blue:0]];
            
        } else {
            [tile setTileColour:[Colour initWithRed:255 green:255 blue:255]];
            [tile assignContents:@"white"];
        }
        [row addObject:tile];
    }
    return row;
    //this will be called by scroll and tiles at the top row will be assigned their contents
}

-(void)update:(CFTimeInterval)currentTime {
    if ( fmod(currentTime, 1.0) < 0.03) {
        [self scroll];
    }
}
-(NSInteger)random {
    float row = (1.0f/((self.tileColumnCount+1^2)*1.0f))*100.0f;
    float chance = arc4random_uniform(100);
    if(chance < row) {
        return self.lastTilePosition;
        self.tileColumnCount +=1;
    } else {
        self.lastTilePosition =arc4random_uniform(self.delegate.width);
        return self.lastTilePosition;
        self.tileColumnCount = 1;
    }
    
}
@end
