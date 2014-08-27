//
//  TSDGame.h
//  Stff4Stff4Stff4Stff
//
//  Created by Tom Copcutt on 8/12/14.
//  Copyright (c) 2014 TheSwaggyDog. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface Game : NSObject

@property NSInteger turnNumber;

-(BOOL)isLegalMove;
-(void)nextTurn;
-(void)nextMove;

@end
