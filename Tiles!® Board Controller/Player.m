//
//  Player.m
//  Stff4Stff4Stff4Stff
//
//  Created by Tom Copcutt on 8/13/14.
//  Copyright (c) 2014 TheSwaggyDog. All rights reserved.
//

#import "Player.h"

@implementation Player

- (id)init {
    self = [super init];
    self.name = @"default_name";
    self.piecesOwned = [[NSMutableArray alloc] init];
    
    return self;
}

- (void)assignName:(NSString *)name {
    self.name = name;
}



@end
