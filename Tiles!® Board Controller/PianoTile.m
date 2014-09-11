//
//  PianoTile.m
//  Tiles!® Board Controller
//
//  Created by Tom Copcutt on 9/3/14.
//  Copyright (c) 2014 Matthew Overington. All rights reserved.
//

#import "PianoTile.h"

@implementation PianoTile


-(void)touchAtSquare:(iPadTile *)touchedSquare {
    if ([touchedSquare.contents isEqual:@"black" ]) {
        //register touched
        [self.delegate replaceContentsOfTile:touchedSquare withContents:@"touched"];
        [self.delegate changeColorOfTile:touchedSquare toColour:[Colour colourWithPreset:COLOUR_GRAY]]; //<< idk whats wrong here, i think its cause we used {} rather than []... cbf changing now
        
        
        
    }
    else if ([touchedSquare.contents isEqual:@"white"]) {
        //end game, player died
        
        
    }
    
    
    
    
}




-(void)scroll{
    //shift each row down one and check if black square has been touched. If not, run death method, else continue and create new row
    
}


-(void)gameFinish {
    //end game, player died
    [self.delegate changeColorOfAllTiles:[Colour colourWithPreset:COLOUR_RED]];
}

-(NSArray *)newRow{
    NSMutableArray *row = [[NSMutableArray alloc]init];
    NSInteger blackSquare = arc4random_uniform(4);
    for (NSInteger i; i<4;i++) {
        iPadTile *tile = [[iPadTile alloc]init];
        if (i == blackSquare) {
            [tile assignContents:@"black"];
            
        } else [tile assignContents:@"white"];
        [row addObject:tile];
    }
    return row;
    //this will be called by scroll and tiles at the top row will be assigned their contents
}

@end
