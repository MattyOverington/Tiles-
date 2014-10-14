//
//  PianoTile.m
//  Tiles!® Board Controller
//
//  Created by Tom Copcutt on 9/3/14.
//  Copyright (c) 2014 Matthew Overington. All rights reserved.
//

#import "PianoTile.h"

@implementation PianoTile
- (id)init
{
    self = [super init];
    for (NSInteger i = 0;i<self.delegate.height;i++) {
        
        
        
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
        [self gameFinish];
        
        
    }
 
}




-(void)scroll{
    NSArray* row = [self newRow];
    for (NSInteger i = self.delegate.height; i > 0; i--) {
        for (NSInteger j = 0; j < self.delegate.width; j++) {
            if (i==0) {
                iPadTile *destination = [self.delegate tileWithX:j Y:i];
                iPadTile *source = [row objectAtIndex:j];
                [self.delegate assignContentsOfTile:destination withContents:source.contents];
                [self.delegate changeColorOfTile:destination toColour:source.tileColour];
            }
            else{
                [self.delegate assignContentsOfTile:[self.delegate tileWithX:j Y:i] withContents:[self.delegate tileWithX:j Y:i-1].contents];
                [self.delegate changeColorOfTile:[self.delegate tileWithX:j Y:i] toColour:[self.delegate tileWithX:j Y:i-1].tileColour];
            }
        }
    }
}

-(void)gameFinish {
    //end game, player died
    //[self.delegate changeColorOfAllTiles:[Colour colourWithPreset:COLOUR_RED]];
}

-(NSArray *)newRow{
    NSMutableArray *row = [[NSMutableArray alloc]init];
    NSInteger blackSquare = arc4random_uniform(self.delegate.width);
    for (NSInteger i = 0; i < self.delegate.width; i++) {
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
    if ( fmod(currentTime, 5.0) < 0.03) {
        [self scroll];
    }
}

@end
