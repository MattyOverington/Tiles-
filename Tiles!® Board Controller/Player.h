//
//  Player.h
//  Stff4Stff4Stff4Stff
//
//  Created by Tom Copcutt on 8/13/14.
//  Copyright (c) 2014 TheSwaggyDog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property NSMutableArray* piecesOwned;
@property NSString* name;

-(void)assignName:(NSString *)name;

@end
