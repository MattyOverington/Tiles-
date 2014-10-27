//
//  Game.h
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"
#import "Colour.h"

@protocol GameDelegate <NSObject>

-(void)changeColourOfTile:(Tile*)tile toColour:(Colour*)colour;

@optional

-(void)didBeginGame;
-(void)gameDidEnd;


@end


@interface Game : NSObject

@property NSInteger turnNumber;

-(BOOL)isLegalMove;
-(void)runGame;
-(void)nextTurn;
-(void)perormActionsWithTouches:(NSArray*)touches;

@property id<GameDelegate> delegate;

@end
