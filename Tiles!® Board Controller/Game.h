//
//  Game.h
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface Game : NSObject

@property NSInteger turnNumber;

-(BOOL)isLegalMove;
-(void)nextTurn;
-(void)nextMove;

@end
