//
//  Game.m
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import "Game.h"
#import "Board.h"
#import "Player.h"

@interface Game ()

@property (nonatomic) Board* gameBoard;
@property Player* player1;
@property Player* player2;


@end
@implementation Game

- (id)init {
    self = [super init];
    self.turnNumber = 0;
    
    return self;
}

-(Board *)gameBoard {
    if(!_gameBoard) _gameBoard = [[Board alloc]initWithWidth:8 height:8];
    return _gameBoard;
}

- (void)nextTurn {
    
}

- (void)nextMove {
    
}

- (BOOL)isLegalMove {
   
    return FALSE;
}


@end
