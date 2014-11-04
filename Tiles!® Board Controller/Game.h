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
#import "Board.h"

@protocol GameDelegate <NSObject>

-(void)renderBoard;

@optional

-(void)didBeginGame;
-(void)gameDidEnd;


@end


@interface Game : NSObject

@property NSInteger turnNumber;
@property (nonatomic) Board* gameBoard;

-(void) addTouch:(Touch*)t;
- (void)runGame;

@property id<GameDelegate> delegate;

@end
